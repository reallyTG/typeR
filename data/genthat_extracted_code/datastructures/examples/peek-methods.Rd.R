library(datastructures)


### Name: peek
### Title: Have a look at the first element from an object without removing
###   it
### Aliases: peek peek,deque-method peek,heap-method peek,map-method

### ** Examples


 # peeks into a queue
 q <- queue()
 q <- insert(q, list(environment(), data.frame(a=1)))
 peek(q)

 # peeks into a fibonacci heap
 b_heap <- binomial_heap()
 b_heap <- insert(b_heap, letters[seq(3)], list(1, diag(3), rnorm(2)))
 peek(b_heap)

 # peeks into a \code{hashmap}
 h_map <- hashmap()
 h_map[letters] <- rnorm(length(letters))
 peek(h_map)

 # peeks into a \code{bimap}
 b_map <- bimap("integer", "integer")
 b_map[seq(10)] <- seq(10, 1)
 peek(b_map)




