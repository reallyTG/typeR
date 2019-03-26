library(Rdsm)


### Name: getmatrix
### Title: Referencing a matrix via different forms.
### Aliases: getmatrix

### ** Examples

library(parallel)
c2 <- makeCluster(2)
mgrmakevar(c2,"u",2,2)  # u is a 2x2 bigmemory matrix
u[] <- 8  # fill u with 8s
u[]  # prints a 2x2 matrix of 8s
v <- getmatrix(u)  # get u and assign it to v
# u and v are both addresses, pointing to the same memory location
v[]  # prints all 8s
v[2,1] <- 3
v[]  # prints three 8s and a 3
u[]  # prints three 8s and a 3
w <- getmatrix("u")  # w will also be a copy of u
w[]  # same as u



