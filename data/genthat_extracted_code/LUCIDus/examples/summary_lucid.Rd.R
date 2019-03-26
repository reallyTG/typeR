library(LUCIDus)


### Name: summary_lucid
### Title: Summarize results for integrative clustering
### Aliases: summary_lucid

### ** Examples

# For a testing dataset with 10 genetic features (5 causal) and 4 biomarkers (2 causal)

# Integrative clustering without feature selection
set.seed(10)
IntClusFit <- est_lucid(G=G1,Z=Z1,Y=Y1,K=2,family="binary",Pred=TRUE)

# Check important model outputs
summary_lucid(IntClusFit)



