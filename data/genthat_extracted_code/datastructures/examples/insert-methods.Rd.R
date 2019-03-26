library(datastructures)


### Name: insert
### Title: Add elements to an object
### Aliases: insert insert,deque,ANY,missing-method
###   insert,deque,list,missing-method insert,heap,vector,vector-method
###   insert,heap,vector,matrix-method insert,heap,vector,list-method
###   insert,heap,vector,ANY-method insert,bimap,vector,vector-method
###   insert,unordered_map,vector,vector-method
###   insert,unordered_map,vector,list-method
###   insert,unordered_map,vector,ANY-method

### ** Examples


 # inserts values into a multimap
 m_map <- multimap()
 m_map <- insert(m_map, c("a", "b"), 1:2)
 m_map <- insert(m_map, c("a", "b"), list(1, list(a=1)))
 m_map["a"] <- rnorm(length(letters))
 m_map[c("a", "b", "c")] <- list(1, data.frame(a=2), environment())

 # inserts values into a fibonacci_heap
 f_heap <- fibonacci_heap("integer")
 f_heap <- insert(f_heap, 1:2, 1:2)
 f_heap[3:4] <- list(1, list(a=1))
 f_heap <- insert(f_heap, 5:6, list(data.frame(a=rnorm(3)), diag(2)))

 # inserts elements into a queue or stack
 s <- stack()
 s <- insert(s, list(1, vector(), list(3), data.frame(rnorm(3))))




