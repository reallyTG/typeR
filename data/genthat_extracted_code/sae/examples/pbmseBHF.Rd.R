library(sae)


### Name: pbmseBHF
### Title: Parametric bootstrap mean squared error estimators of the EBLUPs
###   of means obtained under a nested error linear regression model.
### Aliases: pbmseBHF
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

# Compute parametric bootstrap MSEs of the EBLUPs of means of crop areas 
# for each county.
set.seed(123) 
result <- pbmseBHF(CornHec ~ CornPix + SoyBeansPix, dom=County,
                   selectdom=c(10,1,5), meanxpop=Xmean, popnsize=Popn,
                   B=50, data=cornsoybean)
result

detach(cornsoybeanmeans)



