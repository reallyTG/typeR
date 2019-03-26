library(spc4sts)


### Name: disMat
### Title: Pairwise Dissimilarity Matrix of Stochastic Textured Surfaces
### Aliases: disMat

### ** Examples

## generate images: the first two are similar, the third is different with the other two
phi1 <- c(.6, .6, .5)
phi2 <- c(.35, .35, .3)
imgs <- array(0, c(100,100,3))
for (j in 1:dim(imgs)[3])
  imgs[,,j] <- sarGen(phi1 = phi1[j], phi2 = phi2[j], m = 100, n = 100, border = 50)
## compute KL and AKL dissimilarity matrices
disMat(imgs = imgs, nb = 1)



