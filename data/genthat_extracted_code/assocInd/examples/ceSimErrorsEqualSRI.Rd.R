library(assocInd)


### Name: ceSimErrorsEqualSRI
### Title: Simulate SRI under combined group and individual location errors
### Aliases: ceSimErrorsEqualSRI

### ** Examples


	# Set a real association index
	aAB <- 0.5
	
	# Set w range
	w <- seq(-1,1,0.1)

	# Set errors parameters
	psi <- 0.5
	E <- 0.5
	
	# Replicate N times
	replicates <- 100  # small number used to save computation time
	
	# Create a blank storage matrices
	assocStrength <- matrix(NA,nrow=replicates,ncol=length(w))
	inCIs <- matrix(NA,nrow=replicates,ncol=length(w))
	
	# Loop through repeating N times for each error value
	for (i in 1:length(w)) { 
		for (j in 1:replicates) {
			out <- ceSimErrorsEqualSRI(aAB,w[i],psi,E,20)
			assocStrength[j,i] <- out[1]
			inCIs[j,i] <- out[2]
		}
	}
	
	# Plot the results
	par(mfrow=c(1,2))
	plot(w,colMeans(assocStrength, na.rm=TRUE), pch=20, ylim=c(0,1), ylab="Simulated SRI")
	CIs <- apply(assocStrength,2,quantile,c(0.025,0.975),na.rm=TRUE)
	arrows(w,CIs[1,],w,CIs[2,],len=0.1,code=3,angle=90)
	abline(h=0.5,col="red")
	
	plot(w,colMeans(inCIs, na.rm=TRUE), pch=20, ylim=c(0,1), ylab="Percent of times in CIs")
	abline(h=0.95, col="red")




