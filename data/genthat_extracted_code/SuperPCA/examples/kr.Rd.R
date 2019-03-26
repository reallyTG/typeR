library(SuperPCA)


### Name: kr
### Title: Compute a string of Khatri-Rao products
### Aliases: kr

### ** Examples

#ex1
m1 <- matrix(1:9,3,3)
m2 <- matrix(1:12,4,3)
m3 <- matrix(13:27,5,3)
l1 <- list(m1,m2,m3)
kr(l1)
#ex2
l2 <- list(m1,m3)
kr(l2)



