library(PtProcess)


### Name: linksrm
### Title: Linked Stress Release Model Object
### Aliases: linksrm
### Keywords: classes

### ** Examples

p <- c(-1.5, -1.5, 0.01, 0.03, 2, -0.5, 0.2, 1, 1*log(10), 3)
TT <- c(0, 1000)

rexptrunc_mark <- function(ti, data, params){
    x <- rexp(n=1, params[1])
    x[x > params[2]] <- params[2]
    names(x) <- "magnitude"
    return(x)
}

x <- linksrm(data=NULL,
             gif=linksrm_gif,
             marks=list(NULL, rexptrunc_mark),
             params=p,
             gmap=expression(params[1:8]),
             mmap=expression(params[9:10]),
             TT=TT)

x <- simulate(x, seed=5)
print(logLik(x))

#   estimate parameters
temp_map <- function(y, p){
    #    map only gif parameters into model object
    y$params[1:8] <- p
    return(y)
}

weight <- c(0.1, 0.1, 0.005, 0.005, 0.1, 0.1, 0.1, 0.1)

#   see manual page for linksrm_gif for modifications to
#   make calculations faster

#   for testing, restrict to 5 iterations
z <- nlm(neglogLik, p[1:8], object=x, pmap=temp_map,
         hessian=TRUE, gradtol=1e-08, steptol=1e-10,
         print.level=2, iterlim=5, typsize=weight)

param.names <- c("a1", "a2", "b1", "b2", "c11", "c12", "c21", "c22")
param.est <- cbind(p[1:8], z$estimate, sqrt(diag(solve(z$hessian))))
dimnames(param.est) <- list(param.names,
                            c("Actual", "Estimate", "StdErr"))
print(param.est)

#   place parameter estimates into model object
x <- temp_map(x, z$estimate)

#   plot ground intensity function
par.default <- par(mfrow=c(2,1), mar=c(4.1, 4.1, 0.5, 1))
x$gif <- linksrm_gif
plot(x, 1, xlab="")
plot(x, 2)
par(par.default)

#   plot "residuals" for each region
tau <- residuals(x)
par(mfrow=c(2,1))
for (i in 1:2){
    plot(tau[[i]], ylab="Transformed Time",
         xlab="Event Number", main=paste("Region", i))
    abline(a=0, b=1, lty=2, col="red")
}

#   plot cusum of "residuals" for each region
for (i in 1:2){
    plot(tau[[i]] - 1:length(tau[[i]]), ylab="Cusum of Transformed Time",
         xlab="Event Number", main=paste("Region", i))
    abline(h=0, lty=2, col="red")
}

par(mfrow=c(1,1))



