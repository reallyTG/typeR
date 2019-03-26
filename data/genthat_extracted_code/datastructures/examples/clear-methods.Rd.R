library(datastructures)


### Name: clear
### Title: Remove all elements from a datastructure
### Aliases: clear clear,deque-method clear,heap-method clear,map-method

### ** Examples


 # clears a multimap
 m_map <- multimap()
 m_map <- insert(m_map, c("a", "b"), 1:2)
 m_map <- insert(m_map, c("a", "b"), list(1, list(a=1)))
 m_map <- clear(m_map)


 # clears a heap
 f_heap <- fibonacci_heap("integer")
 f_heap <- insert(f_heap, 1:2, 1:2)
 f_heap[3:4] <-  list(1, list(a=1))
 f_heap <- clear(f_heap)

 # clears a \code{deque}
 s <- stack()
 s <- insert(s, list(1, vector(), list(3), data.frame(rnorm(3))))
 s <- clear(s)




