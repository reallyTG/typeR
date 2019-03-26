library(amap)


### Name: pop
### Title: Optimal Partition (classification).
### Aliases: pop
### Keywords: multivariate

### ** Examples


## pop from a data matrix
data <-
matrix(c(1,1,1,1,1
        ,1,2,1,2,1
        ,2,3,2,3,2
        ,2,4,3,3,2
        ,1,2,4,2,1
        ,2,3,2,3,1),ncol=5,byrow=TRUE)



pop(diss(data))


## pop from a dissimilarity matrix

d <-2 * matrix(c(9,  8,  5,  7,  7,  2
,  8,  9,  2,  5,  1,  7
,  5,  2,  9,  8,  7,  1
,  7,  5,  8,  9,  3,  2
,  7,  1,  7,  3,  9,  6
,  2,  7,  1,  2,  6,  9),ncol=6,byrow=TRUE) - 9

pop(d)


## Not run: 
##D d <- 2 * matrix(c(57, 15, 11, 32,  1, 34,  4,  6, 17,  7
##D , 15, 57, 27, 35, 27, 27, 20, 24, 30, 15
##D , 11, 27, 57, 25, 25, 20, 34, 25, 17, 15
##D , 32, 35, 25, 57, 22, 44, 13, 22, 30, 11
##D ,  1, 27, 25, 22, 57, 21, 28, 43, 20, 13
##D , 34, 27, 20, 44, 21, 57, 18, 27, 21,  8
##D ,  4, 20, 34, 13, 28, 18, 57, 31, 28, 13
##D ,  6, 24, 25, 22, 43, 27, 31, 57, 30, 15
##D , 17, 30, 17, 30, 20, 21, 28, 30, 57, 12
##D ,  7, 15, 15, 11, 13,  8, 13, 15, 12, 57),ncol=10,byrow=TRUE) - 57
##D 
##D pop(d)
##D 
##D 
## End(Not run)




