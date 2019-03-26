library(morpheus)


### Name: optimParams
### Title: Optimize parameters
### Aliases: optimParams

### ** Examples

# Optimize parameters from estimated mu
io = generateSampleIO(10000, 1/2, matrix(c(1,-2,3,1),ncol=2), c(0,0), "logit")
mu = computeMu(io$X, io$Y, list(K=2))
M <- computeMoments(io$X, io$Y)
o <- optimParams(2, "logit", list(M=M))
x0 <- c(1/2, as.double(mu), c(0,0))
par0 <- o$run(x0)
# Compare with another starting point
x1 <- c(1/2, 2*as.double(mu), c(0,0))
par1 <- o$run(x1)
o$f( o$linArgs(par0) )
o$f( o$linArgs(par1) )



