library(otuSummary)


### Name: matrixConvert
### Title: Convert lower triangular distance matrix into data frame
### Aliases: matrixConvert
### Keywords: convert

### ** Examples

data(varespec)
mat <- vegdist(varespec, method = "bray")
mat.m <- matrixConvert(varespec, colname = c("sp1", "sp2", "bray"))



