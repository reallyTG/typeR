library(sdcMicro)


### Name: argus_microaggregation
### Title: argus_microaggregation
### Aliases: argus_microaggregation

### ** Examples

mat <- matrix(sample(1:100, 50, replace=TRUE), nrow=10, ncol=5)
df <- as.data.frame(mat)
res <- argus_microaggregation(df, k=5, useOptimal=FALSE)



