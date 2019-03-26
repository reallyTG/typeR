library(palaeoSig)


### Name: randomTF
### Title: Proportion of variance in the fossil data explained by an
###   environmental reconstruction
### Aliases: randomTF plot.palaeoSig ModelMaker randomTFmm
### Keywords: multivariate htest hplot

### ** Examples

require(rioja)
data(SWAP)
data(RLGH)

rlghr <- randomTF(spp = sqrt(SWAP$spec), env = data.frame(pH = SWAP$pH), 
    fos = sqrt(RLGH$spec), n = 99, fun = WA, col = 1)
rlghr$sig
plot.palaeoSig(rlghr, "pH")




