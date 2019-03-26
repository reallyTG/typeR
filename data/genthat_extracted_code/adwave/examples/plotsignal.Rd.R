library(adwave)


### Name: plotsignal
### Title: Plot Localized Admixture Signals
### Aliases: plotsignal

### ** Examples

data(admix)

# Generate the admixture signal with windowing
AdexPCA2 <- signal(admix$data,popA="popA",popB="popB",populations=admix$populations,
		tol=0.001,n.signal=1000,window.size=0.01)

# Plot resulting admixture signal for one individual
plotsignal(AdexPCA2,ind="AD00001",popA=AdexPCA2$popA,popB=AdexPCA2$popB)



