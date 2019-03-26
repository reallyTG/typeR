library(DDM)


### Name: seg
### Title: estimate death registration coverage using the synthetic extinct
###   generation method
### Aliases: seg

### ** Examples

# The Mozambique data
res <- seg(Moz)
res
# The Brasil data
BM <- seg(BrasilMales)
BF <- seg(BrasilFemales)
head(BM)
head(BF)



