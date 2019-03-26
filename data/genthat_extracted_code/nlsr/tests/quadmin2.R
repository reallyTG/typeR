# Test of nlsr hessian and gradient

fexp <- ~ ((x-1)^2)*((y-3)^2)
fexp
library(nlsr)
myder <- fnDeriv(fexp, c("x","y"), hessian=TRUE)
myder
old <- c(x=0, y=-0)
myd <- function(prm=old){
  x <- prm[1]
  y <- prm[2]
  val <- myder(x, y)
}
aold <- myd(old)
aold
hm1a <- attr(aold, "hessian")
hm <- as.matrix(hm1a[1,,])
hm
g1 <- attr(aold, "gradient")
g1 <- as.vector(g1)
g1

old <- c(1e20, 1e20)
new <- c(x=0, y=-0)

count <- 0
while (max(abs(new-old)) > 1e-6 ) {
  old <- new
  count <- count + 1
  cat("iteration ", count,"  ")
  newf<-myd(new)
  newf
  hm1a <- attr(newf, "hessian")
  hm <- as.matrix(hm1a[1,,])
  hm
  g1 <- attr(newf, "gradient")
  g1 <- as.vector(g1)
  g1
  delta <- solve(hm, g1)
#  cat("delta:")
#  print(delta)
  new <- old-delta
  cat("new:")
  print(new)
  newf<-myd(new)
  cat("Function value = ",newf,"\n")
  hm1a <- attr(newf, "hessian")
  hm <- as.matrix(hm1a[1,,])
  hm
  g1 <- attr(newf, "gradient")
  g1 <- as.vector(g1)
  g1
#  print(new)
#  print(old)
  tmp <- readline("continue?")
}
