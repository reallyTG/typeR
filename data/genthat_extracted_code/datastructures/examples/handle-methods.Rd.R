library(datastructures)


### Name: handle
### Title: Get the handles and values for nodes of a specific key in a
###   heap.
### Aliases: handle handle,heap,vector,missing-method
###   handle,heap,missing,list-method handle,heap,missing,vector-method
###   handle,heap,missing,matrix-method

### ** Examples

 # returns the handle of a heap
 f_heap <- fibonacci_heap("integer")
 f_heap <- insert(f_heap, 1:5, letters[1:5])

 handle(f_heap, key=3L)

 handle(f_heap, value=letters[3])




