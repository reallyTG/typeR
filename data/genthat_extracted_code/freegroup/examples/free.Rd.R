library(freegroup)


### Name: free
### Title: Objects of class 'free'
### Aliases: free as.free is.free list_to_free

### ** Examples

free(rbind(1:5,5:1))

x <- rfree(10,4)
x
x+x
x-x
x * (0:3)


as.free(c(4,3,2,2,2))
as.free("aaaabccccaaaaa")



