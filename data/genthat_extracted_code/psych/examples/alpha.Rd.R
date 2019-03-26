library(psych)


### Name: alpha
### Title: Find two estimates of reliability: Cronbach's alpha and
###   Guttman's Lambda 6.
### Aliases: alpha alpha.scale alpha.ci
### Keywords: models multivariate

### ** Examples

set.seed(42) #keep the same starting values
#four congeneric measures
r4 <- sim.congeneric()
alpha(r4)
#nine hierarchical measures -- should actually use omega
r9 <- sim.hierarchical()
alpha(r9)

# examples of two independent factors that produce reasonable alphas
#this is a case where alpha is a poor indicator of unidimensionality

two.f <- sim.item(8)
#specify which items to reverse key by name
 alpha(two.f,keys=c("V3","V4","V5","V6"))
 
 #automatic reversal base upon first component
alpha(two.f,check.keys=TRUE)    #note that the median is much less than the average R
#this suggests (correctly) that the 1 factor model is probably wrong 
#an example with discrete item responses  -- show the frequencies
items <- sim.congeneric(N=500,short=FALSE,low=-2,high=2,
        categorical=TRUE) #500 responses to 4 discrete items with 5 categories
a4 <- alpha(items$observed)  #item response analysis of congeneric measures
a4
#summary just gives Alpha
summary(a4)



