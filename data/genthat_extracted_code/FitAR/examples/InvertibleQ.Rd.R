library(FitAR)


### Name: InvertibleQ
### Title: Test if Invertible or Stationary-casual
### Aliases: InvertibleQ
### Keywords: ts

### ** Examples

#simple examples
InvertibleQ(0.5)
#find the area of the invertible region for AR(2). 
#We assume that the parameters must be less than 2 in absolute value.
#From the well-known diagram in the book of Box and Jenkins (1970), 
#this area is exactly 4.
NSIM<-10^4
phi1<-runif(NSIM, min=-2, max=2)
phi2<-runif(NSIM, min=-2, max=2)
k<-sum(apply(matrix(c(phi1,phi2),ncol=2), MARGIN=1, FUN=InvertibleQ))
area<-16*k/NSIM
area



