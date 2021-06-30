def range(num_1, num_2)
    new_arr = []
    (num_1...num_2).each do |num|
        new_arr << num
    end
    new_arr
end

def rec_range(num_1, num_2)
    return [] if num_2 <= num_1
    rec_range(num_1, num_2 - 1) << num_2 - 1
end

# p rec_range(5, 10)


def sum(array)
    array.inject { |acc, ele| acc + ele }
end


def sums(array, sum=0)
    return sum if array.empty?
    sums(array[1..-1], sum += array[0])
end

def expo_1(base, power)
    return base if power <= 1
    base * base = expo_1(base, power - 1)
end

def expo_2(base, power)


end
# p expo_1(2, 1)

class Array

    def deep_dup
        return self if !self.is_a?(Array)
        deep = self.dup
        self.each_with_index do |ele, i|
            if ele.is_a?(Array)
                deep[i] = ele.deep_dup
            end
        end
        deep
    end

end

# a = [1, 2, 3, 4]
# p a.deep_dup


def fib(n)
    return [0, 1].take(n) if n <= 2
    last_fib = fib(n - 1)
    last_fib << last_fib[-1] + last_fib[-2]
end

# p fib(9)

def fibs_itter(n)
    return [] if n == 0
    return [0] if n == 1
    fibs = [0, 1]

    while fibs.count < n
        fibs << fibs[-2] + fibs[-1]
    end
    fibs
end

def bsearch(array, target)
    return nil if !array.include?(target)
    return array.index(target) if array.last == target
    bsearch(array[0...-1], target)
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(arr_1, arr_2)
    if arr_1.empty?
        arr_2
    elsif arr_2.empty?
        arr_1
    elsif arr_1.first < arr_2.first
        [arr_1.first] + merge(arr_1[1..arr_1.length], arr_2)
    else
        [arr_2.first] + merge(arr_1, arr_2[1..arr_2.length])
    end
end

def merge_sort(array)
    if array.length <= 1
        array
    else
        mid = (array.length/2).floor
        left = merge_sort(array[0..mid - 1])
        right = merge_sort(array[mid..array.length])
        merge(left, right)
    end
end

# p merge_sort([3, 6, 9, 4, 2, 1])

def subsets(array)
    return [[]] if array.empty?
    subs = subsets(array[1..-1]) + [array[0..-1]]
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
