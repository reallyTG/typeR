library(crank)


### Name: fillArow
### Title: Impute a row of ranks using the existing values of rankings
### Aliases: fillArow
### Keywords: misc

### ** Examples

 # The first example matrix from Lim and Wolfe (2002)
 lwmat<-matrix(c(3,1,2,4,NA,2,1,NA,2,NA,1,NA),nrow=3,byrow=TRUE)
 # complete the second row with maximal consistency
 fillArow(lwmat,lwmat[1,],2)
 # now with minimal consistency
 fillArow(lwmat,lwmat[1,],2,maxcon=FALSE)



