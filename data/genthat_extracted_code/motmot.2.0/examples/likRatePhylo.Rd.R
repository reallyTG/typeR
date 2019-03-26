library(motmot.2.0)


### Name: likRatePhylo
### Title: Log-likelihood rate estimation for traits and phylogenies
### Aliases: likRatePhylo

### ** Examples

data(anolis.tree)
data(anolis.data)

## Convert data to class rateData with a rateMatrix object as input
anolis.rateMatrix <- as.rateMatrix(phy=anolis.tree, x="geo_ecomorph", data=anolis.data)

anolis.rateData <- as.rateData(y="Female_SVL", x="geo_ecomorph", 
rateMatrix = anolis.rateMatrix, phy=NULL, data=anolis.data, log.y=TRUE)

## Calculate phylogenetic mean, variance, log likelihood for a model where the first 

# mean only
phyloMean(rateData=anolis.rateData, rate = c(1,2,0.1,1), common.mean = FALSE)

# variance only
phyloVar(rateData=anolis.rateData, rate = c(1,2,0.1,1), common.mean = FALSE) 

# mean, variance and log-likelihood
likRatePhylo(rateData=anolis.rateData, rate = c(1,2,0.1,1), common.mean = FALSE) 



