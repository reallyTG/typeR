library(MSnID)


### Name: correct_peak_selection
### Title: Corrects wrong selection of monoisotopic peak
### Aliases: correct_peak_selection

### ** Examples

data(c_elegans)
# plot original mass error
massErr <- (msnidObj$experimentalMassToCharge - 
            msnidObj$calculatedMassToCharge) * 
            msnidObj$chargeState
hist(massErr,xlim=c(-1,+1), breaks=seq(-1.5,+1.5,0.01))
# fixing the problem of picking wrong monoisotopic peak
msnidObj <- correct_peak_selection(msnidObj)
# plot fixed mass error
massErr <- (msnidObj$experimentalMassToCharge - 
            msnidObj$calculatedMassToCharge) * 
            msnidObj$chargeState
hist(massErr,xlim=c(-1,+1), breaks=seq(-1.5,+1.5,0.01))



