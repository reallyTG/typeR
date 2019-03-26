library(ecotoxicology)


### Name: AdjustAbbott
### Title: Calculate corrected efficacy % with Abbott's formula
### Aliases: AdjustAbbott

### ** Examples

#same result as example on Short-term Methods for Estimating the Chronic Toxicity of
#Effluents and Receiving Waters to Freshwater Organisms.TABLE J1. page 312
data(SheepsheadMinnow40SK)
IsMonotonicallyIncreasing(SheepsheadMinnow40SK[,2]/40)
mydata <- cbind(SheepsheadMinnow40SK,
  MakeMonotonicallyIncreasing(cbind(rep(40,6),SheepsheadMinnow40SK[,2])))
AdjustAbbott(mydata[,3])



