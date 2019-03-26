library(CEGO)


### Name: landscapeGeneratorGaussian
### Title: Create Gaussian Landscape
### Aliases: landscapeGeneratorGaussian

### ** Examples

#rng seed
seed=101
# distance function
dF <- function(x,y)(sum((x-y)^2)) #sum of squares 
#dF <- function(x,y)sqrt(sum((x-y)^2)) #euclidean distance
# creation function
cF <- function()runif(1)
# plot pars
par(mfrow=c(3,1),mar=c(3.5,3.5,0.2,0.2),mgp=c(2,1,0))
## uni modal distance landscape
# set seed
set.seed(seed)
#landscape
lF <- landscapeGeneratorUNI(cF(),dF)
x <- as.list(seq(from=0,by=0.001,to=1))
plot(x,lF(x),type="l")
## multi-modal distance landscape
# set seed
set.seed(seed)
#landscape
lF <- landscapeGeneratorMUL(replicate(5,cF(),FALSE),dF)
plot(x,lF(x),type="l")
## glg landscape
#landscape
lF <- landscapeGeneratorGaussian(nGaussian=20,theta=1,
ratio=0.3,seed=seed,dF,cF)
plot(x,lF(x),type="l")




