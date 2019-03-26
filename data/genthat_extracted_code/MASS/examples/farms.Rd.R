library(MASS)


### Name: farms
### Title: Ecological Factors in Farm Management
### Aliases: farms
### Keywords: datasets

### ** Examples

farms.mca <- mca(farms, abbrev = TRUE)  # Use levels as names
eqscplot(farms.mca$cs, type = "n")
text(farms.mca$rs, cex = 0.7)
text(farms.mca$cs, labels = dimnames(farms.mca$cs)[[1]], cex = 0.7)



