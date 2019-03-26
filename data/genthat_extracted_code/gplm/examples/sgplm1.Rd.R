library(gplm)


### Name: sgplm1
### Title: Generalized partial linear model
### Aliases: sgplm1
### Keywords: smooth

### ** Examples

  ## generate data
  n <- 1000; b <- c(1,-1); rho <- 0.7
  mm <- function(t){ 1.5*sin(pi*t) }
  x1 <- runif(n,min=-1,max=1); u  <- runif(n,min=-1,max=1)
  t  <- runif(n,min=-1,max=1); x2 <- round(mm(rho*t + (1-rho)*u))
  x  <- cbind(x1,x2)
  y  <- x %*% b + mm(t) + rnorm(n)

  ## fit partial linear model (PLM)
  k.plm <- kgplm(x,t,y,h=0.35,family="gaussian",link="identity")
  s.plm <- sgplm1(x,t,y,spar=0.95,family="gaussian",link="identity")

  o <- order(t)
  ylim <- range(c(mm(t[o]),k.plm$m,s.plm$m),na.rm=TRUE)
  plot(t[o],mm(t[o]),type="l",ylim=ylim)
  lines(t[o],k.plm$m[o], col="green")
  lines(t[o],s.plm$m[o], col="blue")
  rug(t); title("Kernel PLM vs. Spline PLM")

  ## fit partial linear probit model (GPLM)
  y <- (y>0)
  k.gplm <- kgplm(x,t,y,h=0.35,family="bernoulli",link="probit")
  s.gplm <- sgplm1(x,t,y,spar=0.95,family="bernoulli",link="probit")

  o <- order(t)
  ylim <- range(c(mm(t[o]),k.gplm$m,s.gplm$m),na.rm=TRUE)
  plot(t[o],mm(t[o]),type="l",ylim=ylim)
  lines(t[o],k.gplm$m[o], col="green")
  lines(t[o],s.gplm$m[o], col="blue")
  rug(t); title("Kernel GPLM vs. Spline GPLM (Probit)")



