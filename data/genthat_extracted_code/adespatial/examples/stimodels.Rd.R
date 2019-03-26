library(adespatial)


### Name: stimodels
### Title: Space-time interaction in ANOVA without replication
### Aliases: stimodels quicksti
### Keywords: multivariate spatial

### ** Examples


data(trichoptera)

# log-transform species data (excluding site and time colums)
trich.log <- log1p(trichoptera[,-c(1,2)]) 


# Run space-time interaction test using model "5"
stimodels(trich.log, S=22, Ti=10, nperm=99, model="5")

# Run space-time analysis with tests for main effects after testing 
# interaction (which is significant)
quicksti(trich.log, S=22, Ti=10, nperm=99)

# Run space-time analysis for time blocks number 6 and 7. 
# Interaction is then not significant and tests of main effects are done 
# following model 5
quicksti(trich.log[111:154,], S=22, Ti=2, nperm=99)




