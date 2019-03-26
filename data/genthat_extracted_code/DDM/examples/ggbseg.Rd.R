library(DDM)


### Name: ggbseg
### Title: estimate death registration coverage using the hybrid
###   generalized growth balance and synthetic extinct generation
### Aliases: ggbseg

### ** Examples

# The Mozambique data
res <- ggbseg(Moz)
res
# The Brasil data
BM <- ggbseg(BrasilMales)
BF <- ggbseg(BrasilFemales)
head(BM)
head(BF)



