library(gnm)


### Name: wheat
### Title: Wheat Yields from Mexican Field Trials
### Aliases: wheat
### Keywords: datasets

### ** Examples

set.seed(1)

##  Scale yields to reproduce analyses reported in Vargas et al (2001)
yield.scaled <- wheat$yield * sqrt(3/1000)

##  Reproduce (up to error caused by rounding) Table 1 of Vargas et al (2001)
aov(yield.scaled ~ year*tillage*summerCrop*manure*N, data = wheat)
treatment <- interaction(wheat$tillage, wheat$summerCrop, wheat$manure,
                         wheat$N, sep = "")
mainEffects <- lm(yield.scaled ~ year + treatment, data = wheat)
svdStart <- residSVD(mainEffects, year, treatment, 3)
bilinear1 <- update(asGnm(mainEffects), . ~ . + 
                    Mult(year, treatment),
                    start = c(coef(mainEffects), svdStart[,1]))
bilinear2 <- update(bilinear1, . ~ . + 
                    Mult(year, treatment, inst = 2),
                    start = c(coef(bilinear1), svdStart[,2]))
bilinear3 <- update(bilinear2, . ~ . + 
                    Mult(year, treatment, inst = 3),
                    start = c(coef(bilinear2), svdStart[,3]))
anova(mainEffects, bilinear1, bilinear2, bilinear3)

##  Examine the extent to which, say, mTF explains the first bilinear term
bilinear1mTF <- gnm(yield.scaled ~ year + treatment + Mult(1 + mTF, treatment),
                    family = gaussian, data = wheat)
anova(mainEffects, bilinear1mTF, bilinear1)

##  How to get the standard SVD representation of an AMMI-n model
##
##  We'll work with the AMMI-2 model, which here is called "bilinear2"
##
##  First, extract the contributions of the 5 terms in the model:
##
wheat.terms <- termPredictors(bilinear2)
##
##  That's a matrix, whose 4th and 5th columns are the interaction terms
##
##  Combine those two interaction terms, to get the total estimated
##  interaction effect:
##
wheat.interaction <- wheat.terms[, 4] + wheat.terms[, 5]
##
##  That's a vector, so we need to re-shape it as a 24 by 10 matrix
##  ready for calculating the SVD:
##
wheat.interaction <- matrix(wheat.interaction, 24, 10)
##
##  Now we can compute the SVD:
##
wheat.interaction.SVD <- svd(wheat.interaction)
##
##  Only the first two singular values are nonzero, as expected
##  (since this is an AMMI-2 model, the interaction has rank 2)
##
##  So the result object can be simplified by re-calculating the SVD with
##  just two dimensions:
##
wheat.interaction.SVD <- svd(wheat.interaction, nu = 2, nv = 2)



