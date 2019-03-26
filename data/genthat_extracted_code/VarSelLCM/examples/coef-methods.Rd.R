library(VarSelLCM)


### Name: coef
### Title: Extract the parameters
### Aliases: coef coef,VSLCMresults-method

### ** Examples

# Data loading:
data(heart)

# Cluster analysis without variable selection (number of clusters between 1 and 3)
res  <- VarSelCluster(heart[,-13], 1:3, vbleSelec = FALSE)

# Get the ICL value
coef(res)



