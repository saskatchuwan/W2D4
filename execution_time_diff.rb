#my_min
#Phase I: time complexity O(n^2) because nested loop x 2
# space c = O(1) bc we are only ever storing 1 new 
# variable no matter how big the list is.

def my_min1(list)
    # min = list.first                        
    # list.length.times do |i|
    #     el1 = list[i]                   
    #     (i+1...list.length).each do |el2|                  
    #         min = el2 if el2 < el1          
    #     end
    # end
    # min
   
    list.each_with_index do |el1, i|
        smallest = true
        list.each_with_index do |el2, j|
            next if i == j
           
            smallest = false if el2 < el1
        end
        return el1 if smallest == true
    end
end 

# Phase II: O(n) - worst case would be if the min is at
# end of array and we loop thru entire array
# space complexity : O(1)
# if list.each_with_index do |el|, it would reduce the O
#  versus list.each do |el|
def my_min2(list)
    min = list.first
    list.each_with_index do |el, i|
        next if i == 0
        min = el if el < min
    end
    min
end

#what is the time complexity of this function?
# space complexity O(1)
def my_min3(list)
    min
end


#Largest Contiguous SubSum
#Phase 1: time complexity would be O(n^2)
# space complexity = 

def lcs_1(array)
    
    sub_arrs = []
    array.each_with_index do |el1, i|
        array.each_with_index do |el2, j|
            sub_arrs << array[i..j]
        end
    end
    
    sub_arrs.select! { |arr| arr != [] }
    sub_arrs.max_by { |arr| arr.reduce(:+) }.reduce(:+)
end

def lcs_2(array)
    max_sum = array.first    #5
    curr_sum = array.first   #-1

    array.each_with_index do |num, i| 
        next if i == 0
        if curr_sum == 0 #need to revise    
            if max_sum + num > max_sum  #5+7
                max_sum += num           
            elsif num > max_sum       
                max_sum = num
            else                       
                curr_sum = max_sum + num    #curr_sum = -1
                curr_sum = array[i+1]
            end
        else
            if num + curr_sum > max_sum
                max_sum = num + curr_sum
                curr_sum = 0
            end
        end
    end

    return max_sum
end

# def lcs_2(array)
#     sum = array.first
#     array.each_with_index do |num, i|
#         next if i == 0
#         left = array[1..i]
#         right = array[i..-1]
#         if num > sum
#             sum = num
#         elsif left.reduce(:+)
#             sum = left.reduce(:+)
#         elsif right.reduce(:+)
#             sum = right.reduce(:+)
#         else

#         end
#     end
#     sum
# end


if $PROGRAM_NAME == __FILE__
    #my_min1([ 0, 3, 5, 4, -5, 10, 1, 90 ])
    #my_min2([ 0, 3, 5, 4, -5, 10, 1, 90 ])
    # p lcs_2([-5, -1, -3])
    p lcs_2([2, 3, -6, 7, -6, 7])
end