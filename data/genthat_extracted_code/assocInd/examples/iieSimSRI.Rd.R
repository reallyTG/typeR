library(assocInd)


### Name: iieSimSRI
### Title: Simulate SRI with individual identification error
### Aliases: iieSimSRI

### ** Examples


	# Set a real association index
	aAB <- 0.5

	# Create a range of errors
	e <- seq(0,0.8,0.01)
	
	# Replicate N times
	replicates <- 100  # small number used to save computation time
	
	# Create a blank storage matrices
	assocStrength <- matrix(NA,nrow=replicates,ncol=length(e))
	inCIs <- matrix(NA,nrow=replicates,ncol=length(e))
	
	# Loop through repeating N times for each error value
	for (i in 1:length(e)) { 
		for (j in 1:replicates) {
			out <- iieSimSRI(aAB,e[i],20)
			assocStrength[j,i] <- out[1]
			inCIs[j,i] <- out[2]
		}
	}
	
	# Plot the results
	par(mfrow=c(1,2))
	plot(e,colMeans(assocStrength, na.rm=TRUE), pch=20, ylim=c(0,1), ylab="Simulated SRI")
	CIs <- apply(assocStrength,2,quantile,c(0.025,0.975),na.rm=TRUE)
	arrows(e,CIs[1,],e,CIs[2,],len=0.1,code=3,angle=90)
	abline(h=0.5,col="red")
	
	plot(e,colMeans(inCIs, na.rm=TRUE), pch=20, ylim=c(0,1), ylab="Percent of times in CIs")
	abline(h=0.95, col="red")




