library(tgp)


### Name: optim.tgp
### Title: Surrogate-based optimization of noisy black-box function
### Aliases: optim.step.tgp optim.ptgpf
### Keywords: optimize design

### ** Examples

## optimize the simple exponential function 
f <- function(x) { exp2d.Z(x)$Z }

## create the initial design with D-optimal candidates
rect <- rbind(c(-2,6), c(-2,6))
Xcand <- lhs(500, rect)
X <- dopt.gp(50, X=NULL, Xcand)$XX
Z <- f(X)

## do 10 rounds of adaptive sampling
out <- progress <- NULL
for(i in 1:10) {

  ## get recommendations for the next point to sample
  out <- optim.step.tgp(f, X=X, Z=Z, rect=rect, prev=out)

  ## add in the inputs, and newly sampled outputs
  X <- rbind(X, out$X)
  Z <- c(Z, f(out$X))

  ## keep track of progress and best optimum
  progress <- rbind(progress, out$progress)
  print(progress[i,])
}

## plot the progress so far
par(mfrow=c(2,2))
plot(out$obj, layout="surf")
plot(out$obj, layout="as", as="improv")
matplot(progress[,1:nrow(rect)], main="optim results",
        xlab="rounds", ylab="x[,1:2]", type="l", lwd=2)
plot(log(progress$improv), type="l", main="max log improv",
     xlab="rounds", ylab="max log(improv)")



