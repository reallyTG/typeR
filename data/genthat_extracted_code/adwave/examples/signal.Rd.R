library(adwave)


### Name: signal
### Title: Compute Localized Admixture Signals
### Aliases: signal

### ** Examples

data(admix)

# EXAMPLE 1
# Generate the admixture signal 
AdexPCA <- signal(admix$data,popA="popA",popB="popB",populations=admix$populations,tol=0.001,
		n.signal=NULL)

# Plot the resulting PCA
plot(AdexPCA$pc.ind[,1],AdexPCA$pc.ind[,2],col=admix$colplot,xlab="PC1",ylab="PC2",pch=16)
legend("bottomright",c("popA","popB","popAB"),col=c(3,4,2),pch=16)


# EXAMPLE 2
# Generate the admixture signal with windowing
AdexPCA2 <- signal(admix$data,popA="popA",popB="popB",populations=admix$populations,tol=0.001,
		n.signal=1000,window.size=0.01)

# Plot resulting admixture signal for one individual
plotsignal(AdexPCA2,ind="AD00001",popA=AdexPCA2$popA,popB=AdexPCA2$popB)


# EXAMPLE 3
# Generate the admixture signal with windowing
# As in EXAMPLE 2 but with n.signal reduced to 100 to provide disjoint windows
AdexPCA3 <- signal(admix$data,popA="popA",popB="popB",populations=admix$populations,tol=0.001,
		n.signal=100,window.size=0.01)

# Plot resulting admixture signal for one individual
plotsignal(AdexPCA3,ind="AD00001",popA=AdexPCA2$popA,popB=AdexPCA2$popB)


# EXAMPLE 4
# Generate the admixture signal in terms of genetic distance
# As in EXAMPLE 2 but with genmap specified so that signals are formulated using genetic distances
AdexPCA4 <- signal(admix$data,popA="popA",popB="popB",populations=admix$populations,tol=0.001,
	n.signal=1000,window.size=0.01,genmap=admix$map[,2])

# Plot resulting admixture signal for one individual
plotsignal(AdexPCA4,ind="AD00001",popA=AdexPCA4$popA,popB=AdexPCA4$popB)



