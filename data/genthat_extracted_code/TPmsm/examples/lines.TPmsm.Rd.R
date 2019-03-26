library(TPmsm)


### Name: lines.TPmsm
### Title: lines method for a TPmsm object
### Aliases: lines.TPmsm
### Keywords: aplot methods survival

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Create survTP object
data(bladderTP)
bladderTP_obj <- with( bladderTP, survTP(time1, event1, Stime, event) )

# Compute transition probabilities without confidence band
KMW <- transKMW(object=bladderTP_obj, s=5, t=59, conf=FALSE, method.est=1)
KMPW <- transKMPW(object=bladderTP_obj, s=5, t=59, conf=FALSE, method.est=1)
AJ <- transAJ(object=bladderTP_obj, s=5, t=59, conf=FALSE)
PAJ <- transPAJ(object=bladderTP_obj, s=5, t=59, conf=FALSE)
LIN <- transLIN(object=bladderTP_obj, s=5, t=59, conf=FALSE)
LS <- transLS(object=bladderTP_obj, s=5, t=59, h=c(0.25, 2.5),
nh=25, ncv=50, conf=FALSE)

# Plot '1 2' KMW transition probability estimate
par( mfrow=c(1, 1) )
plot(KMW, tr.choice="1 2", ylab="P12(5, Time)", xlab="Time",
col=1, lty=1, legend=FALSE)

# Add other '1 2' transition probability estimates
lines(KMPW, tr.choice="1 2", col=2, lty=1)
lines(AJ, tr.choice="1 2", col=3, lty=1)
lines(PAJ, tr.choice="1 2", col=4, lty=1)
lines(LIN, tr.choice="1 2", col=5, lty=1)
lines(LS, tr.choice="1 2", col=6, lty=1)

# Add legend
legend(x="topleft", legend=c("KMW", "KMPW", "AJ", "PAJ", "LIN", "LS"),
col=1:6, lty=1, bty="n")

# Plot all the transitions
tr.choice <- colnames(KMW$est)
par.orig <- par( c("mfrow", "cex") )
par( mfrow=c(2, 3) )
for ( i in seq_len( length(tr.choice) ) ) {
	plot(KMW, tr.choice=tr.choice[i], col=1, lty=1, legend=FALSE,
	main=tr.choice[i], xlab="", ylab="")
	lines(KMPW, tr.choice=tr.choice[i], col=2, lty=1)
	lines(AJ, tr.choice=tr.choice[i], col=3, lty=1)
	lines(PAJ, tr.choice=tr.choice[i], col=4, lty=1)
	lines(LIN, tr.choice=tr.choice[i], col=5, lty=1)
	lines(LS, tr.choice=tr.choice[i], col=6, lty=1)
}
plot.new()
legend(x="center", legend=c("KMW", "KMPW", "AJ", "PAJ", "LIN", "LS"),
col=1:6, lty=1, bty="n", cex=1.5)
par(mfrow=c(1, 1), cex=1.2)
title(xlab="Time", ylab="Transition probability", line=3)
par(par.orig)

# Restore the number of threads
setThreadsTP(nth)



