library(VarSelLCM)


### Name: fitted.values
### Title: Extract the partition or the probabilities of classification
### Aliases: fitted.values fitted.values,VSLCMresults-method

### ** Examples

# Data loading:
data(heart)

# Cluster analysis without variable selection (number of clusters between 1 and 3)
res <- VarSelCluster(heart[,-13], 2, vbleSelec = FALSE)

# Get the ICL value
fitted.values(res)



