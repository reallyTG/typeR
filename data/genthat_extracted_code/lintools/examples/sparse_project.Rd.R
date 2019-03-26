library(lintools)


### Name: sparse_project
### Title: Successive projections with sparsely defined restrictions
### Aliases: sparse_project

### ** Examples


# the system 
# x + y = 10
# -x <= 0   # ==> x > 0
# -y <= 0   # ==> y > 0
# Defined in the row-column-coefficient form:

A <- data.frame(
    row = c(1,1,2,3)
  , col = c(1,2,1,2)
  , coef= c(1,1,-1,-1)
)
b <- c(10,0,0)

sparse_project(x=c(4,5),A=A,b=b)




