library(datastructures)


### Name: decrease_key
### Title: Decreases the key of a node in a heap
### Aliases: decrease_key decrease_key,heap,vector,vector,character-method
###   decrease_key,heap,vector,vector,missing-method

### ** Examples


 # decreases the key of a heap
 f_heap <- fibonacci_heap("integer")
 f_heap <- insert(f_heap, 1:5, letters[1:5])
 peek(f_heap)

 decrease_key(f_heap, 5L, -1L)
 peek(f_heap)

 hand <- handle(f_heap, value=letters[3])
 decrease_key(f_heap, hand[[1]]$key, -2L)
 peek(f_heap)




