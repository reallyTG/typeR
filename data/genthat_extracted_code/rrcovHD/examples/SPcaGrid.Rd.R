library(rrcovHD)


### Name: SPcaGrid
### Title: Sparse Robust Principal Components based on Projection Pursuit
###   (PP): GRID search Algorithm
### Aliases: SPcaGrid SPcaGrid.formula SPcaGrid.default
### Keywords: robust multivariate

### ** Examples


data(bus)
bus <- as.matrix(bus)

## calculate MADN for each variable
xmad <- apply(bus, 2, mad)
cat("\nMin, Max of MADN: ", min(xmad), max(xmad), "\n")

## calculate MADN for each variable
xqn <- apply(bus, 2, Qn)
cat("\nMin, Max of Qn: ", min(xqn), max(xqn), "\n")


## MADN vary between 0 (for variable 9) and 34. Therefore exclude
##  variable 9 and divide the remaining variables by their MADNs.
bus1 <- bus[, -c(9)]
p <- ncol(bus1)

madbus <- apply(bus1, 2, mad)
bus2 <- sweep(bus1, 2, madbus, "/", check.margin = FALSE)

xsd <- apply(bus1, 2, sd)
bus.sd <- sweep(bus1, 2, xsd, "/", check.margin = FALSE)

xqn <- apply(bus1, 2, Qn)
bus.qn <- sweep(bus1, 2, xqn, "/", check.margin = FALSE)

## Not run: 
##D spc <- SPcaGrid(bus2, lambda=0, method="sd", k=p, kmax=p)
##D rspc <- SPcaGrid(bus2, lambda=0, method="Qn", k=p, kmax=p)
##D summary(spc)
##D summary(rspc)
##D screeplot(spc, type="line", main="Classical PCA", sub="PC", cex.main=2)
##D screeplot(rspc, type="line", main="Robust PCA", sub="PC", cex.main=2)
##D 
##D ##  find lambda
##D 
##D K <- 4
##D lambda.sd <- 1.64
##D     to.sd <- .tradeoff(bus2, k=K, lambda.max=2.5, lambda.n=100, method="sd")
##D     plot(to.sd, type="b", xlab="lambda", ylab="Explained Variance (percent)")
##D     abline(v=lambda.sd, lty="dotted")
##D  
##D spc.sd.p <- SPcaGrid(bus2, lambda=lambda.sd, method="sd", k=p)
##D .CPEV(spc.sd.p, k=K)
##D spc.sd <- SPcaGrid(bus2, lambda=lambda.sd, method="sd", k=K)
##D getLoadings(spc.sd)[,1:K]
##D plot(spc.sd)
##D 
##D lambda.qn <- 2.06
##D     to.qn <- .tradeoff(bus2, k=K, lambda.max=2.5, lambda.n=100, method="Qn")
##D     plot(to.qn, type="b", xlab="lambda", ylab="Explained Variance (percent)")
##D     abline(v=lambda.qn, lty="dotted")
##D 
##D spc.qn.p <- SPcaGrid(bus2, lambda=lambda.qn, method="Qn", k=p)
##D .CPEV(spc.qn.p, k=K)
##D spc.qn <- SPcaGrid(bus2, lambda=lambda.qn, method="Qn", k=K)
##D getLoadings(spc.qn)[,1:K]
##D plot(spc.qn)
## End(Not run)

## DD-plots
##
## Not run:
## Not run: 
##D usr <- par(mfrow=c(2,2))
##D plot(SPcaGrid(bus2, lambda=0, method="sd", k=4), id.n.sd=0, main="Standard PCA")
##D plot(SPcaGrid(bus2, lambda=0, method="Qn", k=4), id.n.sd=0, ylim=c(0,20))
##D 
##D plot(SPcaGrid(bus2, lambda=1.64, method="sd", k=4), id.n.sd=0, main="Stdandard sparse PCA")
##D plot(SPcaGrid(bus2, lambda=3.07, method="Qn", k=4), id.n.sd=0, main="Robust sparse PCA")
##D 
##D par(usr)
##D ## End (Not run)
## End(Not run)



