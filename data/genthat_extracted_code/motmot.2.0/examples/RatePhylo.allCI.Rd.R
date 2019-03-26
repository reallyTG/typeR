library(motmot.2.0)


### Name: RatePhylo.allCI
### Title: Confidence intervals for rate parameters
### Aliases: RatePhylo.allCI

### ** Examples

data(anolis.data)
data(anolis.tree)
## Convert data to class rateData with a rateMatrix object as input
anolis.rateMatrix <- as.rateMatrix(phy=anolis.tree, x="geo_ecomorph", data=anolis.data)

anolis.rateData <- as.rateData(y="Female_SVL", x="geo_ecomorph", 
rateMatrix = anolis.rateMatrix, phy=NULL, data=anolis.data, log.y=TRUE)

# A model with a different rate in each of the four groups. The 'fixed' command is used to determine
# whether a particular rate is to be constrained or not. Use '1' to fix a group and 'FALSE' to show 
# that the parameter is not fixed and should be estimated. The values should be entered in the same
# order as the ranking of the groups. That is, group 0 (small islands) takes position one in the 
# fixed vector, group 1 (large island trunk crown and trunk ground) takes position 2 and so on. The 
# default is to allow each group to take a different mean. 

anole.ML <- optim.likRatePhylo(rateData=anolis.rateData, rate=NULL,
fixed=c(FALSE,FALSE,FALSE, FALSE),
common.mean=FALSE, lambda.est=FALSE)

# Confidence intervals for the first two parameters

RatePhylo.CI(rateData=anolis.rateData, MLrate = anole.ML$MLRate, 
fixed=c(FALSE, TRUE, TRUE, TRUE), rateMIN = 0.001, rateMAX = 50, 
common.mean = FALSE)



