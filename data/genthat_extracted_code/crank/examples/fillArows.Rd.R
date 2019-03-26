library(crank)


### Name: fillArows
### Title: Impute ranks using the existing values of rankings
### Aliases: fillArows
### Keywords: misc

### ** Examples

 # The first example matrix from Lim and Wolfe (2002)
 lwmat<-matrix(c(3,1,2,4,NA,2,1,NA,2,NA,1,NA),nrow=3,byrow=TRUE)
 # complete with maximal consistency, permuting row order
 fillArows(lwmat)
 # now with minimal consistency as above
 fillArows(lwmat,maxcon=FALSE)



