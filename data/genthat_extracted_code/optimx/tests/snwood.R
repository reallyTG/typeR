require(optimx)
#Example: Wood function
#
wood.f <- function(x){
  res <- 100*(x[1]^2-x[2])^2+(1-x[1])^2+90*(x[3]^2-x[4])^2+(1-x[3])^2+
    10.1*((1-x[2])^2+(1-x[4])^2)+19.8*(1-x[2])*(1-x[4])
  return(res)
}
#gradient:
wood.g <- function(x){
  g1 <- 400*x[1]^3-400*x[1]*x[2]+2*x[1]-2
  g2 <- -200*x[1]^2+220.2*x[2]+19.8*x[4]-40
  g3 <- 360*x[3]^3-360*x[3]*x[4]+2*x[3]-2
  g4 <- -180*x[3]^2+200.2*x[4]+19.8*x[2]-40
  return(c(g1,g2,g3,g4))
}
#hessian:
wood.h <- function(x){
  h11 <- 1200*x[1]^2-400*x[2]+2;    h12 <- -400*x[1]; h13 <- h14 <- 0
  h22 <- 220.2; h23 <- 0;    h24 <- 19.8
  h33 <- 1080*x[3]^2-360*x[4]+2;    h34 <- -360*x[3]
  h44 <- 200.2
  H <- matrix(c(h11,h12,h13,h14,h12,h22,h23,h24,
                h13,h23,h33,h34,h14,h24,h34,h44),ncol=4)
  return(H)
}

wood.fgh <- function(x){
      fval <- wood.f(x)
      gval <- wood.g(x)
      hval <- wood.h(x)
      attr(fval,"gradient") <- gval
      attr(fval,"hessian")<- hval
      fval
}
 
#################################################
x0 <- c(-3,-1,-3,-1) # Wood standard start

# library(snewton)
cat("This FAILS to find minimum\n")
wd <- snewton(x0, fn=wood.f, gr=wood.g, hess=wood.h, control=list(trace=1))
print(wd)
cat("  with optimr\n")
wdo <- optimr(x0, fn=wood.f, gr=wood.g, hess=wood.h, method="snewton", control=list(trace=1))
print(wdo)

wdm <- snewtonm(x0, fn=wood.f, gr=wood.g, hess=wood.h, control=list(trace=1))
print(wdm)

cat("\n\n nlm() gives similar results\n")
t1nlm <- nlm(wood.fgh, x0, print.level=1)
print(t1nlm)


## BUT ... it looks like nlminb is NOT using a true Newton-type method
t1nlminb <- nlminb(x0, wood.f, gradient=wood.g, hessian=wood.h, control=list(trace=1))
print(t1nlminb)
# and call them from optimx (i.e., test this gives same results)

t1nlmo <- optimr(x0, wood.f, wood.g, hess=wood.h, method="nlm", control=list(trace=1))
print(t1nlmo)

## FOLLOWING SHOWS UP ERRORS??
t1nlminbo <- optimr(x0, wood.f, wood.g, hess=wood.h, method="nlminb", control=list(trace=1))
print(t1nlminb)


# sink()
