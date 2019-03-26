library(datastructures)


### Name: pop
### Title: Pop a single element from an object
### Aliases: pop pop,deque-method pop,heap-method

### ** Examples


 # pops from a queue
 q <- queue()
 q <- insert(q, list(environment(), data.frame(a=1)))
 pop(q)

 # pops from a stack
 s <- stack()
 s <- insert(s, list(environment(), data.frame(a=1)))
 pop(s)

 # pops from a fibonacci heap
 b_heap <- binomial_heap()
 b_heap <- insert(b_heap, letters[seq(3)], list(1, diag(3), rnorm(2)))
 pop(b_heap)




