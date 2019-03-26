library(secrlinear)


### Name: glymemask
### Title: Linear Mask for Water Vole Dataset
### Aliases: glymemask
### Keywords: datasets

### ** Examples


plot(glymemask)
summary(glymemask)

## add a covariate, the distance downstream from the first mask point
downstrm <- networkdistance(glymemask, glymemask[1,], glymemask)[,1]
covariates(glymemask)<- data.frame(downstream = downstrm)




