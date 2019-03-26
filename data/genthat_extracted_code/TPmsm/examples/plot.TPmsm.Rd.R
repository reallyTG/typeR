library(TPmsm)


### Name: plot.TPmsm
### Title: plot method for a TPmsm object
### Aliases: plot.TPmsm
### Keywords: hplot methods survival

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Create survTP object
data(bladderTP)
bladderTP_obj <- with(bladderTP, survTP(time1, event1, Stime, event))

# Compute KMW transition probabilities with confidence band
TPmsm_obj <- transKMW(object=bladderTP_obj, s=5, t=59, conf=TRUE, conf.level=0.95,
method.boot="basic", method.est=2)

# Plot all the transitions without confidence band
plot(TPmsm_obj, conf.int=FALSE, col=seq_len(5), lty=1)

# Plot all the transitions with confidence band
tr.choice <- colnames(TPmsm_obj$est)
par.orig <- par( c("mfrow", "cex") )
par( mfrow=c(2,3) )
for ( i in seq_len( length(tr.choice) ) ) {
	plot(TPmsm_obj, tr.choice=tr.choice[i], conf.int=TRUE, legend=FALSE, main=tr.choice[i],
	xlab="", ylab="")
}
par(mfrow=c(1, 1), cex=1.2)
title(xlab="Time", ylab="Transition probability", line=3)
par(par.orig)

# Restore the number of threads
setThreadsTP(nth)



