library(wiqid)


### Name: AICc
### Title: Akaike's Information Criterion with small-sample correction -
###   AICc
### Aliases: AICc

### ** Examples

# Occupancy models
data(salamanders)
mt <- occSStime(salamanders, p ~ .time, plot=FALSE)
mT <- occSStime(salamanders, p ~ .Time, plot=FALSE)
AIC(mt, mT)
AICc(mt, mT)
# The default sample size = the number of sites
nobs(mt) == nrow(salamanders)
# It is sometimes taken to be the total number of surveys...
AICc(mt, mT, nobs=length(salamanders))
# ... or the minimum of ...
n <- min(sum(rowSums(salamanders) > 0), # sites where species was detected
         sum(rowSums(salamanders) == 0)) # sites where species was not detected
AICc(mt, mT, nobs=n)

# Survival models
data(dippers)
DH <- dippers[1:7]  # Extract the detection histories
null <- survCJS(DH)  # the phi(.) p(.) model
phit <- survCJS(DH, phi ~ .time)  # the phi(t) p(.) model
full <- survCJS(DH, list(phi ~ .time, p ~ .time))  # the phi(t) p(t) model
AICc(null, phit, full)
# for the full model, all 12 parameters cannot be estimated;
#   we can manually set df=11 for this model:
AICc(null, phit, full, df=c(NA, NA, 11))



