library(VarSelLCM)


### Name: BIC
### Title: BIC criterion.
### Aliases: BIC BIC,VSLCMresults-method

### ** Examples

# Data loading:
data(heart)

# Cluster analysis without variable selection (number of clusters between 1 and 3)
res<- VarSelCluster(heart[,-13], 2, vbleSelec = FALSE)

# Get the BIC value
BIC(res)



