library(TPmsm)


### Name: lines.TPCmsm
### Title: lines method for a TPCmsm object
### Aliases: lines.TPCmsm
### Keywords: aplot methods survival

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Create survTP object
data(heartTP)
heartTP_obj <- with( heartTP, survTP(time1, event1, Stime, event, age=age) )

# Compute IPCW1 conditional transition probabilities without confidence band
TPC_IPCW1 <- transIPCW(heartTP_obj, s=57, t=310, x=15, conf=FALSE, method.est=1)

# Compute IPCW2 conditional transition probabilities without confidence band
TPC_IPCW2 <- transIPCW(heartTP_obj, s=57, t=310, x=15, conf=FALSE, method.est=2)

# Compute LIN conditional transition probabilities without confidence band
TPC_LIN <- transLIN(heartTP_obj, s=57, t=310, x=15, conf=FALSE)

# Build covariate plots
tr.choice <- dimnames(TPC_LIN$est)[[3]]
par.orig <- par( c("mfrow", "cex") )
par( mfrow=c(2,3) )
for ( i in seq_len( length(tr.choice) ) ) {
	plot(TPC_IPCW1, plot.type="c", tr.choice=tr.choice[i], legend=FALSE,
	main=tr.choice[i], col=1, lty=1, xlab="", ylab="")
	lines(TPC_IPCW2, plot.type="c", tr.choice=tr.choice[i], legend=FALSE, col=2, lty=1)
	lines(TPC_LIN, plot.type="c", tr.choice=tr.choice[i], legend=FALSE, col=3, lty=1)
}
plot.new()
legend(x="center", legend=c("IPCW1", "IPCW2", "LIN"), col=1:3, lty=1, bty="n", cex=1.5)
par(mfrow=c(1, 1), cex=1.2)
title(xlab="Age", ylab="Transition probability", line=3)
par(par.orig)

# Restore the number of threads
setThreadsTP(nth)



