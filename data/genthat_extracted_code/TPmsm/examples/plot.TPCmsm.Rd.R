library(TPmsm)


### Name: plot.TPCmsm
### Title: plot method for a TPCmsm object
### Aliases: plot.TPCmsm
### Keywords: hplot methods survival

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Create survTP object
data(heartTP)
heartTP_obj <- with( heartTP, survTP(time1, event1, Stime, event, age=age) )

# Compute IPCW conditional transition probabilities with confidence band
TPCmsm_obj <- transIPCW(heartTP_obj, s=57, t=310, x=c(0, 15), conf=TRUE, n.boot=100,
method.boot="percentile", method.est=2)

# Build time plots
tr.choice <- dimnames(TPCmsm_obj$est)[[3]]
par.orig <- par( c("mfrow", "cex") )
par( mfrow=c(2,3) )
for ( i in seq_len( length(tr.choice) ) ) {
	plot(TPCmsm_obj, plot.type="t", tr.choice=tr.choice[i], conf.int=TRUE, legend=TRUE,
	main=tr.choice[i], col=seq_len( length(TPCmsm_obj$x) ), lty=1, xlab="", ylab="",
	curvlab=c("Age = 0", "Age = 15"))
}
par(mfrow=c(1, 1), cex=1.2)
title(xlab="Time", ylab="Transition probability", line=3)
par(par.orig)

# Build covariate plots without colors and without confidence band
plot(TPCmsm_obj, plot.type="c", xlab="Age")

# Build covariate plots with colors and without confidence band
plot(TPCmsm_obj, plot.type="c", col=seq_len(5), lty=1, xlab="Age")

# Build covariate plots with confidence band
tr.choice <- dimnames(TPCmsm_obj$est)[[3]]
par.orig <- par( c("mfrow", "cex") )
par( mfrow=c(2,3) )
for ( i in seq_len( length(tr.choice) ) ) {
	plot(TPCmsm_obj, plot.type="c", tr.choice=tr.choice[i], conf.int=TRUE, legend=FALSE,
	main=tr.choice[i], xlab="", ylab="")
}
par(mfrow=c(1, 1), cex=1.2)
title( xlab="Age", ylab=paste("P(", TPCmsm_obj$s, ", ", TPCmsm_obj$t, " | Age)", sep=""), line=3)
par(par.orig)

# Restore the number of threads
setThreadsTP(nth)



