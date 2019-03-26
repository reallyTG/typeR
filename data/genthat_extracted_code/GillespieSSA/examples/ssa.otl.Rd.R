library(GillespieSSA)


### Name: ssa.otl
### Title: Optimized tau-leap method (OTL)
### Aliases: ssa.otl
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
  out <- ssa.otl(x,a(parms,x),nu,hor=1,nc=10,epsilon=0.03,dtf=10,nd=100)  
  x <- x + out$nu_j
  t <- t + 1
  cat("t:",t,", x:",x,"\n")
}



