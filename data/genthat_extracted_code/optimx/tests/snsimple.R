require(optimx)
# Try testing calls to see what is transferred (eventually test also ...)
# setup
x0<-c(1,2,3,4)
fnt <- function(x, fscale=10){
  yy <- length(x):1
  val <- sum((yy*x)^2)*fscale
}
grt <- function(x, fscale=10){
  nn <- length(x)
  yy <- nn:1
  #    gg <- rep(NA,nn)
  gg <- 2*(yy^2)*x*fscale
  gg
}

hesst <- function(x, fscale=10){
  nn <- length(x)
  yy <- nn:1
  hh <- diag(2*yy^2*fscale)
  hh
}

# library(snewton)
t1 <- snewton(x0, fnt, grt, hesst, control=list(trace=2), fscale=3.0)
print(t1)
# we can also use nlm and nlminb
fght <- function(x, fscale=10){
  ## combine f, g and h into single function for nlm
     ff <- fnt(x, fscale)
     gg <- grt(x, fscale)
     hh <- hesst(x, fscale)
     attr(ff, "gradient") <- gg
     attr(ff, "hessian") <- hh
     ff
}

t1nlm <- nlm(fght, x0, fscale=3.0, hessian=TRUE, print.level=1)
print(t1nlm)

## BUT ... it looks like nlminb is NOT using a true Newton-type method
t1nlminb <- nlminb(x0, fnt, gradient=grt, hessian=hesst, fscale=3.0, control=list(trace=1))
print(t1nlminb)
# and call them from optimx (i.e., test this gives same results)

t1nlmo <- optimr(x0, fnt, grt, hess=hesst, method="nlm", fscale=3.0, control=list(trace=1))
print(t1nlmo)

## FOLLOWING SHOWS UP ERRORS??
t1nlminbo <- optimr(x0, fnt, grt, hess=hesst, method="nlminb", fscale=3.0, control=list(trace=1))
print(t1nlminb)
