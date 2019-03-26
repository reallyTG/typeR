library(scam)


### Name: vis.scam
### Title: Visualization of SCAM objects
### Aliases: vis.scam persp
### Keywords: hplot models smooth regression

### ** Examples

library(scam)

# Example with factor variable
set.seed(0)
fac<-rep(1:4,20)
x <- runif(80)*5;
y <- fac+log(x)/5+rnorm(80)*0.1
fac <- factor(fac)
b <- scam(y~fac+s(x,bs="mpi"))

vis.scam(b,theta=-35,color="heat") # factor example

# Example with "by" variable

z<-rnorm(80)*0.4   
y<-as.numeric(fac)+log(x)*z+rnorm(80)*0.1
b<-scam(y~fac+s(x,by=z))
g <- gam(y~fac+s(x,by=z))

vis.scam(b,theta=-35,color="terrain",cond=list(z=1)) # by variable example
vis.scam(b,view=c("z","x"),theta= 65) # plot against by variable




