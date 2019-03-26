library(GillespieSSA)


### Name: ssa.etl
### Title: Explicit tau-leap method (ETL)
### Aliases: ssa.etl
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
  out <- ssa.etl(a(parms,x),nu,tau=0.3)
  x <- x + out$nu_j
  t <- t + 1
  cat("t:",t,", x:",x,"\n")
}



