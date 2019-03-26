library(FMStable)


### Name: Gstable
### Title: General Stable Distributions
### Aliases: Gstable tailsGstable
### Keywords: distribution

### ** Examples

# Check relationship between maximally skew and other stable distributions
# in paper by J.M. Chambers, C.L. Mallows and B.W. Stuck
alpha <- 1.9
beta <- -.5
k <- 1- abs(1-alpha)
denom <- sin(pi*k)
p <- (sin(.5*pi*k * (1+beta))/denom)^(1/alpha)
q <- (sin(.5*pi*k * (1-beta))/denom)^(1/alpha)
# Probability that p S1 - q S2 < x
S1 <- setParam(alpha=1.9, location=0, logscale =log(p), pm="C")
S2 <- setParam(alpha=1.9, location=0, logscale =log(q), pm="C")
S3 <- setParam(alpha=1.9, location=0, logscale =0, pm="C")
xgiven <- 1
f <- function(x) dEstable(x, S1) * pEstable(xgiven + x, S2)
print(integrate(f, lower=-Inf, upper=Inf, rel.tol=1.e-12)$value, digits=16)
f <- function(x) dEstable(x, S3) * pEstable((xgiven + p*x)/q, S3)
print(integrate(f, lower=-Inf, upper=Inf, rel.tol=1.e-8)$value, digits=16)
direct <- tailsGstable(x=xgiven, logabsx=log(xgiven),alpha=alpha,
  beta=beta, parametrization=2)
print(direct$left.tail.prob, digits=16)

# Compare Estable and Gstable
# List fractional discrepancies
disc <- function(tol){
  for(pm in pms) for (a in alphas) for(x in xs) {
    lx <- log(abs(x))
    beta <- if(pm==2 && a > 1) -1 else 1
    if(x > 0 || a > 1){
      a1 <- pEstable(x, setParam(alpha=a, location=0, logscale=0, pm=pm))
      a2 <- tailsGstable(x=x, logabsx=lx, alpha=a, beta=beta,
        parametrization=pm)$left.tail.prob
      print(paste("parametrization=", pm, "alpha=", a,"x=", x,
        "Frac disc=", a1/a2-1), quote=FALSE)
    }
  }
}

alphas <- c(.3, .8, 1.1, 1.5, 1.9)
pms <- 0:2
xs <- c(-2, .01, 4.3)
disc()



