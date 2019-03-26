library(lolog)


### Name: summary.lolog
### Title: Summary of a 'lolog' object
### Aliases: summary.lolog

### ** Examples

data(lazega)
fit <- lologVariational(lazega ~ edges() + nodeMatch("office") + triangles, 
                        nReplicates=50L, dyadInclusionRate=1)
summary(fit)



