library(discSurv)


### Name: martingaleResid
### Title: Martingale Residuals
### Aliases: martingaleResid
### Keywords: survival

### ** Examples

# Example with cross validation and unemployment data 
library(Ecdat)
data(UnempDur)
summary(UnempDur$spell)

# Extract subset of data
set.seed(635)
IDsample <- sample(1:dim(UnempDur)[1], 100)
UnempDurSubset <- UnempDur [IDsample, ]

# Calculate martingale residuals for the unemployment data subset
MartResid <- martingaleResid (dataSet=UnempDurSubset, 
survModelFormula=spell ~ age + logwage, censColumn="censor1", 
linkFunc="logit", idColumn=NULL)
MartResid
sum(MartResid$Output$MartingaleResid)

# Plot martingale residuals vs each covariate in the event interval
# Dotted line is a loess estimate
plot(MartResid)



