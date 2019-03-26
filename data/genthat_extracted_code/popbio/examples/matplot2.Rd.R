library(popbio)


### Name: matplot2
### Title: Plot a matrix
### Aliases: matplot2
### Keywords: hplot

### ** Examples


data(calathea)
# survival rates
x<-calathea[9:12]
x<-sapply(x, function(x) colSums(splitA(x, r=1:2)$T))
matplot2(t(x), legend="bottomright", ylab="Survival", 
main="Calathea survival curves")

# Growth rates - do not sort legend
x<-sapply(calathea[-17], lambda)
x<-matrix(x, nrow=4, byrow=TRUE, dimnames= list(paste("plot", 1:4), 1982:1985))
matplot2(x, type='b', lsort=FALSE, ylab="Growth rate", main="Calathea growth rates")

# Convergence to stable stage (excluding seeds)
x<-pop.projection(calathea[[7]], rep(1,8), 10)
matplot2(x$stage.vectors[-1,], prop=TRUE,
 main="Calathea stage vectors", lcex=.7)



