library(MAINT.Data)


### Name: testMod-methods
### Title: Methods for Function testMod in Package 'MAINT.Data'
### Aliases: testMod-methods testMod
### Keywords: methods interval data likelihood ratio test

### ** Examples


# Create an Interval-Data object containing the intervals of temperatures by quarter 
# for 899 Chinese meteorological stations.

ChinaT <- IData(ChinaTemp[1:8])

# Estimate by maximum likelihood the parameters of Gaussian models 
# for the Winter (1st and 4th) quarter intervals

ChinaWTE <- mle(ChinaT[,c(1,4)])
cat("China maximum likelhiood estimation results for Winter quarters:\n")
print(ChinaWTE)

# Perform Likelihood-Ratio tests comparing models with consecutive nested Configuration 
testMod(ChinaWTE)

# Perform Likelihood-Ratio tests comparing all possible models 
testMod(ChinaWTE,FullMod="All")

# Compare model with covariance Configuration case 3 (MidPoints independent of LogRanges) 
# against model with covariance Configuration 1 (unrestricted covariance)  
testMod(ChinaWTE,RestMod=3,FullMod=1)



