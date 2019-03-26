library(entropart)


### Name: CommunityProfile
### Title: Diversity or Entropy Profile of a community
### Aliases: CommunityProfile as.CommunityProfile is.CommunityProfile
###   plot.CommunityProfile CEnvelope

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Plot diversity estimated without bias correction
plot(CommunityProfile(Diversity, Paracou618.MC$Ps, seq(0, 2, 0.2)), 
lty=3, ylim=c(50, 350))
# Estimate diversity, with a condidence envelope 
# (only 10 simulations to save time, should be 1000)
Profile <- CommunityProfile(Diversity, as.AbdVector(Paracou618.MC$Ns), 
		  seq(0, 2, 0.2), Correction="UnveilJ", NumberOfSimulations=10)
# Complete the plot, and add the legend
CEnvelope(Profile, main="Paracou Plots Diversity")
legend("topright", c("Bias Corrected", "Biased"), lty=c(1,3), inset=0.01)

# Advanced use with beta-diversity functions :
# Profile of the beta entropy of the first community of Paracou618.
# Observed and expected probabilities are bound into a 2-column matrix
# An intermediate function is necessary to separate them before calling TsallisBeta
# The CheckArguments is mandatory but does not need to be set: CommunityProfile() sets it to FALSE
CommunityProfile(function(PandPexp, q, CheckArguments) 
  {TsallisBeta(PandPexp[, 1], PandPexp[, 2], q)}, 
  NorP=cbind(Paracou618.MC$Psi[, 1], Paracou618.MC$Ps), q.seq=seq(0, 2, 0.2))



