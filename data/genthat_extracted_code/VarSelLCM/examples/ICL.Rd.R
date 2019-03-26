library(VarSelLCM)


### Name: ICL
### Title: ICL criterion
### Aliases: ICL

### ** Examples

# Data loading:
data(heart)

# Cluster analysis without variable selection
res <- VarSelCluster(heart[,-13], 2, vbleSelec = FALSE)

# Get the ICL value
ICL(res)




