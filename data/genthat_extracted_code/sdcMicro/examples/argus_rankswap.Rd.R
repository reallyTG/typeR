library(sdcMicro)


### Name: argus_rankswap
### Title: argus_rankswap
### Aliases: argus_rankswap

### ** Examples

mat <- matrix(sample(1:100, 50, replace=TRUE), nrow=10, ncol=5)
df <- as.data.frame(mat)
res <- argus_rankswap(df, perc=10)



