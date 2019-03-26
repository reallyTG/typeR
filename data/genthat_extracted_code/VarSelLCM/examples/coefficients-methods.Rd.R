library(VarSelLCM)


### Name: coefficients
### Title: Extract the parameters
### Aliases: coefficients coefficients,VSLCMresults-method

### ** Examples

# Data loading:
data(heart)

# Cluster analysis without variable selection (number of clusters between 1 and 3)
res  <- VarSelCluster(heart[,-13], 1:3, vbleSelec = FALSE)

# Get the ICL value
coefficients(res)



