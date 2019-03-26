library(gnm)


### Name: asGnm
### Title: Coerce Linear Model to gnm Object
### Aliases: asGnm
### Keywords: models regression

### ** Examples

set.seed(1)

##  Scale yields to reproduce analyses reported in Vargas et al (2001)
yield.scaled <- wheat$yield * sqrt(3/1000)
treatment <- interaction(wheat$tillage, wheat$summerCrop, wheat$manure,
                         wheat$N, sep = "")
##  Fit linear model
mainEffects <- lm(yield.scaled ~ year + treatment, data = wheat)

##  Convert to gnm object to allow addition of Mult() term
svdStart <- residSVD(mainEffects, year, treatment, 3)
bilinear1 <- update(asGnm(mainEffects), . ~ . + 
                    Mult(year, treatment),
                    start = c(coef(mainEffects), svdStart[,1]))



