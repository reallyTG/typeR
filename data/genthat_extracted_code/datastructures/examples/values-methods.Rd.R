library(datastructures)


### Name: values
### Title: Get values from an object
### Aliases: values values,heap-method values,bimap-method
###   values,unordered_map-method

### ** Examples


 # shows the values of a hashmap
 h_map <- hashmap("integer")
 h_map <- insert(h_map, seq(2), list(data.frame(a=1), 3))
 values(h_map)

 # shows the values of a multimap
 m_map <- multimap("integer")
 m_map[seq(2)] <- list(diag(2), rnorm(3))
 values(m_map)

 # shows the values of a heap
 f_heap <- fibonacci_heap("integer")
 f_heap <- insert(f_heap, 1:2, list(diag(2), rnorm(3)))
 values(f_heap)




