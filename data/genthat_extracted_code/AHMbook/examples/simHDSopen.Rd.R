library(AHMbook)


### Name: simHDSopen
### Title: Simulate open hierarchical distance sampling data
### Aliases: simHDSopen

### ** Examples

set.seed(123)
tmp <- simHDSopen() # Generate data with default parameters
str(tmp)
head(tmp$data[[1]][[1]])

tmp <- simHDSopen("point")
str(tmp)
head(tmp$data[[1]][[1]])

tmp <- simHDSopen(discard0=FALSE)
str(tmp)
head(tmp$data[[1]][[1]])



