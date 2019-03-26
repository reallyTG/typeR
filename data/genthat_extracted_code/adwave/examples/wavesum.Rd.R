library(adwave)


### Name: wavesum
### Title: Wavelet Summaries of Localized Admixture Signals
### Aliases: wavesum

### ** Examples

data(admix)

# Generate the admixture signal 
AdexPCA <- signal(admix$data,popA="popA",popB="popB",populations=admix$populations,
  tol=0.001, n.signal=NULL)

# Compute wavelet summaries
WSN <- wavesum(AdexPCA,populations=admix$populations,popA="popA",popB="popB")

# Plot raw wavelet variance for each population
barplot(WSN$rv.group[3,],ylim=c(0,0.9),col="red", names.arg=1:11,border=NA)
barplot(WSN$rv.group[1,],ylim=c(0,0.9),col="green3",names.arg=1:11,border=NA,add=TRUE)
barplot(WSN$rv.group[2,],ylim=c(0,0.9),col="blue", names.arg=1:11,border=NA,add=TRUE)
legend("topright",c("popA","popB","popAB"),col=c(3,4,2),pch=15)
box()

# Plot informative wavelet variance for admixed population
barplot(WSN$iv.group[3,],ylim=c(0,0.15),col="red",names.arg=1:11,border=NA)
ABS <- round(WSN$abs.group[3],2) 
text(11,0.13,paste("ABS=",ABS))
box()



