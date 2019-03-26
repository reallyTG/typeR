library(VarSelLCM)


### Name: AIC
### Title: AIC criterion.
### Aliases: AIC AIC,VSLCMresults-method

### ** Examples

# Data loading:
data(heart)

# Cluster analysis without variable selection
res <- VarSelCluster(heart[,-13], 2, vbleSelec = FALSE)

# Get the AIC value
AIC(res)



