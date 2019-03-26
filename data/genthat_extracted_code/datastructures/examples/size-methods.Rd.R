library(datastructures)


### Name: size
### Title: Get the size of an object
### Aliases: size size,deque-method size,heap-method size,map-method

### ** Examples


 # get the size of a hashmap
 h_map <- hashmap()
 h_map[letters] <- rnorm(length(letters))
 size(h_map)

 # get the size of a fibonacci heap
 f_heap <- fibonacci_heap()
 f_heap <- insert(f_heap, letters[seq(3)], list(1, diag(3), rnorm(2)))
 size(f_heap)

 # get the size of a stack
 s <- stack()
 s <- insert(s, list(1))
 size(s)




