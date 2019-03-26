library(bitrugs)


### Name: translinks
### Title: Calculate tree distance
### Aliases: translinks

### ** Examples

data(hospitaldata)
# Patients 48 and 58 are 3 links apart
translinks(48,58,hospitaldata$epi[,1],hospitaldata$epi[,5])
# Patients 89 and 58 are in separate transmission chains
translinks(89,58,hospitaldata$epi[,1],hospitaldata$epi[,5])




