library(Benchmarking)


### Name: dea.dual
### Title: Dual DEA models and assurance regions
### Aliases: dea.dual

### ** Examples


x <- matrix(c(2,5 , 1,2 , 2,2 , 3,2 , 3,1 , 4,1), ncol=2,byrow=TRUE)
y <- matrix(1,nrow=dim(x)[1])
dea.plot.isoquant(x[,1],x[,2],txt=1:dim(x)[1])
segments(0,0, x[,1], x[,2], lty="dotted")


e <- dea(x,y,RTS="crs",SLACK=TRUE)
ed <- dea.dual(x,y,RTS="crs")
print(cbind("e"=e$eff,"ed"=ed$eff, peers(e), lambda(e), 
            e$sx, e$sy, ed$u, ed$v), digits=3)

dual <- matrix(c(.5, 2.5), nrow=dim(x)[2]+dim(y)[2]-2, ncol=2, byrow=TRUE)
er <- dea.dual(x,y,RTS="crs", DUAL=dual)
print(cbind("e"=e$eff,"ar"=er$eff, lambda(e), e$sx, e$sy, er$u, 
            "ratio"=er$u[,2]/er$u[,1],er$v),digits=3)





