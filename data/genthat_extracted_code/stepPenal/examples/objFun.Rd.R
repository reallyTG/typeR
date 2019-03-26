library(stepPenal)


### Name: objFun
### Title: Objective function
### Aliases: objFun

### ** Examples


set.seed(14)
beta    <- c(3, 2, -1.6, -1)
noise   <- 5
simData <- SimData(N=100, beta=beta, noise=noise, corr=FALSE)

x  <- as.matrix(simData[,-1][,1])
y  <- as.matrix(simData$y)
betapoints <- seq(-2,2,0.01)

lamda <- 1
w     <- 0.6
epsilon <- 0.1

out <- numeric(length(betapoints))
for(i in 1:length(betapoints)){
 out[i]<- objFun(x, y, lamda=lamda, w=w, beta=betapoints[i], epsilon=epsilon)
}
plot(betapoints, out, type="l", ylab="objFun")




