library(sae)


### Name: eblupBHF
### Title: EBLUPs of domain means based on a nested error linear regression
###   model.
### Aliases: eblupBHF
### Keywords: method

### ** Examples

# Load data set for segments (units within domains)
data(cornsoybean)

# Load data set for counties
data(cornsoybeanmeans)
attach(cornsoybeanmeans)

# Construct data frame with county means of auxiliary variables for 
# domains. First column must include the county code
Xmean <- data.frame(CountyIndex, MeanCornPixPerSeg, MeanSoyBeansPixPerSeg)
Popn  <- data.frame(CountyIndex, PopnSegments)

# Compute EBLUPs of county means of corn crop areas for all counties
resultCorn <- eblupBHF(CornHec ~ CornPix + SoyBeansPix, dom=County, 
                       meanxpop=Xmean, popnsize=Popn, data=cornsoybean)
resultCorn$eblup

# Compute EBLUPs of county means of soy beans crop areas for
# a subset of counties using ML method
domains <- c(10,1,5)
resultBean <- eblupBHF(SoyBeansHec ~ CornPix + SoyBeansPix, dom=County, 
                       selectdom=domains, meanxpop=Xmean, popnsize=Popn,
                       method="ML", data=cornsoybean)
resultBean$eblup
resultBean$fit

detach(cornsoybeanmeans)



