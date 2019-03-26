library(GPoM)


### Name: wInProd
### Title: Weighted inner product
### Aliases: wInProd

### ** Examples

############
#Example 1 #
############
A1 = c(0,1,2,0,1,3)
A2 = c(1,2,0,0,4,1)
wInProd(A1, A2)

############
#Example 2 #
############
A1 = c(0,1,2,0,1,3)
A2 = c(1,2,0,0,4,1)
w = c(0,0,0,1,1,1)
wInProd(A1, A2, weight = w)




