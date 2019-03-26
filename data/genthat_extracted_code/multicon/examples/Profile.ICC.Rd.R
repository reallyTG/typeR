library(multicon)


### Name: Profile.ICC
### Title: Profile Intra-class Correlation
### Aliases: Profile.ICC
### Keywords: intraclass correlation profile similarity agreement

### ** Examples

data(acq1)
data(acq2)
	#lets look at the Profile ICC between two aquaintance ratings of subjects' personality 
names(acq1) 
names(acq2)
Profile.ICC(acq1, acq2)
	#We can get the descriptives for these using describe() from the 'psych' package   
describe(Profile.ICC(acq1, acq2))




