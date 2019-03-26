library(GillespieSSA)


### Name: ssa.btl
### Title: Binomial tau-leap method (BTL)
### Aliases: ssa.btl
### Keywords: misc datagen ts

### ** Examples

a = function(parms,x){
 b <- parms[1]
 d <- parms[2]
 K <- parms[3]
 N <- x[1]
 return(c(b*N , N*b + (b-d)*N/K))
} 
parms <- c(2,1,1000,500)
x <- 500
nu <- matrix(c(+1, -1),ncol=2)
t <- 0
for (i in seq(100)) {
  out <- ssa.btl(x,a(parms,x),nu,f=10)  
  x <- x + out$nu_j
  t <- t + 1
  cat("t:",t,", x:",x,"\n")
}



