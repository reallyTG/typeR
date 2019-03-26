library(Causata)


### Name: Discretize.CausataData
### Title: Discretizes a continous variable in a CausataData object.
### Aliases: Discretize.CausataData Discretize

### ** Examples

# create a random variable and a dependent variable
set.seed(1234)
ivn <- rnorm(1e5) # random data, normally distributed, no missing values
ivm <- ivn  # create a copy, but replace the first 100 values with NA (missing)
ivm[1:100] <- NA
dvn <- rep(0, 1e5)
dvn[(ivn + rnorm(1e5, sd=0.5))>0] <- 1
causataData <- CausataData(data.frame(ivn__AP=ivn, ivm__AP=ivm), dependent.variable=dvn)

# plot data before discretization
hist(causataData$df$ivn__AP, main="Before discretization.", col="gray")

# the replace outliers step is required
causataData <- ReplaceOutliers(causataData, 'ivn__AP', 
  lowerLimit=min(causataData$df$ivn__AP), 
  upperLimit=max(causataData$df$ivn__AP))

# discretize with deciles, 1st decile is mapped to 1, 2nd to 2, etc.
breaks <- quantile(ivn, probs=seq(0,1,0.1))
causataData <- Discretize(causataData, 'ivn__AP', breaks, 1:10, verbose=TRUE)

# plot data after discretization
hist(causataData$df$ivn__AP, main="After discretization.", col="gray", breaks=seq(0.5,10.5,1))

# Discretize data where missing values are present.  
# One extra value is required for discrete.values, map missing to 0.
# By convention missing values are mapped to the last element in discrete.values
causataData <- ReplaceOutliers(causataData, 'ivm__AP', 
  lowerLimit=min(causataData$df$ivm__AP, na.rm=TRUE),
  upperLimit=max(causataData$df$ivm__AP, na.rm=TRUE))
causataData <- Discretize(causataData, 'ivm__AP', breaks, c(1:10,0), verbose=TRUE)



