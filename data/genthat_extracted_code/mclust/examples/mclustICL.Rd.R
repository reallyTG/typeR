library(mclust)


### Name: mclustICL
### Title: ICL Criterion for Model-Based Clustering
### Aliases: mclustICL print.mclustICL summary.mclustICL
###   print.summary.mclustICL
### Keywords: cluster

### ** Examples

data(faithful)
faithful.ICL <- mclustICL(faithful)
faithful.ICL
summary(faithful.ICL)
plot(faithful.ICL)
## Not run: 
##D # compare with
##D faithful.BIC <- mclustBIC(faithful)
##D faithful.BIC
##D plot(faithful.BIC)
## End(Not run)



