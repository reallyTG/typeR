library(mra)


### Name: F.cjs.simulate
### Title: F.cjs.simulate - Generation of capture histories that follow a
###   CJS model.
### Aliases: F.cjs.simulate
### Keywords: survival models

### ** Examples


## Not run: 
##D 
##D ## Don't run specified because these examples can take > 10 seconds. 
##D 
##D ## Simulate constant model, and analyze
##D 
##D 
##D ns <- 10
##D N <- 100
##D sim.list <- F.cjs.simulate( rep(0.3,ns), rep(0.9,ns-1), N1=N, R=100 )
##D 
##D f.analyze <- function(x){
##D     fit <- F.cjs.estim( ~1, ~1, x$hists, control=mra.control(maxfn=200, cov.meth=2) )
##D     if( fit$exit.code == 1 ){
##D         return( fit$n.hat )
##D     } else {
##D         return( rep(NA,ncol(x$hists)) )
##D     }
##D }
##D results <- t(sapply(sim.list, f.analyze))
##D plot( 1:10, colMeans(results, na.rm=TRUE), xlab="Occasion", 
##D   ylab="Mean population estimate", col="red", type="b")
##D abline( h=N )
##D 
##D ## Plot RMSE by occasion
##D std <- apply(results, 2, sd, na.rm=TRUE)
##D bias <- apply(results - N, 2, mean, na.rm=TRUE)
##D plot( std, bias, type="n" )
##D text( std, bias, 2:10 )
##D abline(h=0)
##D title(main="RMSE by Sample Occasion")
##D 
##D ## Show bias when heterogeniety is present
##D sim.list <- F.cjs.simulate( matrix(c(0.3,.7,.7,.7),4,ns), rep(0.9,ns-1), N1=N, R=100 ) 
##D results <- t(sapply(sim.list, f.analyze))
##D mean.N <- colMeans(results, na.rm=TRUE)
##D plot( 1:length(mean.N), mean.N, ylim=range(c(mean.N,N),na.rm=TRUE), 
##D   xlab="Occasion", ylab="Mean population estimate", col="red", type="b")
##D abline( h=N )
##D abline( h=mean(mean.N), col="red", lty=2)
##D title(main="Heterogeniety causes negative bias")
##D 
##D 
##D ## Simulate CJS model, first estimate one
##D data(dipper.histories)
##D ct <- as.factor( paste("T",1:ncol(dipper.histories), sep=""))
##D attr(ct,"nan")<-nrow(dipper.histories)
##D dipper.cjs <- F.cjs.estim( ~tvar(ct,drop=c(1,2)), ~tvar(ct,drop=c(1,6,7)), dipper.histories )
##D 
##D ## Now generate histories from it.
##D sim.list <- F.cjs.simulate( fit=dipper.cjs, N1=100, birth.rate=rep(1,6), R=100 )
##D 
##D ## Now analyze generated histories using lapply or sapply.  Can fit any model. 
##D ## Here we fit the correct model.
##D f.analyze <- function(x){
##D     #   write a counter to console, this is not necessary
##D     i <- get("i", env=.GlobalEnv) + 1
##D     cat(paste("Iteration", i, "\n"))
##D     assign("i",i,env=.GlobalEnv)
##D     
##D     ct <- as.factor( 1:ncol(x$hists) )
##D     fit <- F.cjs.estim( ~tvar(ct,nan=nrow(x$hists),drop=c(1,2)), 
##D         ~tvar(ct,nan=nrow(x$hists),drop=c(1,6,7)), 
##D         x$hists, control=mra.control(maxfn=200, cov.meth=2) )
##D     if( fit$exit.code == 1 ){
##D         return( fit$n.hat )
##D     } else {
##D         return( rep(NA,ncol(x$hists)) )
##D     }
##D }
##D i <- 0
##D results <- t(sapply(sim.list, f.analyze))
##D mean.N <- colMeans(results, na.rm=TRUE)
##D plot( 1:length(mean.N), mean.N, ylim=range(c(mean.N,N),na.rm=TRUE), 
##D   xlab="Occasion", ylab="Mean population estimate", col="red", type="b")
##D abline( h=N )
##D title(main="Time varying CJS model")
## End(Not run)




