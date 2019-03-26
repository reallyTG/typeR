library(psych)


### Name: factor.scores
### Title: Various ways to estimate factor scores for the factor analysis
###   model
### Aliases: factor.scores
### Keywords: multivariate models

### ** Examples

f3 <- fa(Thurstone)
f3$weights  #just the scoring weights
f5 <- fa(bfi,5) #this does the factor analyis
my.scores <- factor.scores(bfi,f5, method="tenBerge")
#compare the tenBerge factor score correlation to the factor correlations
cor(my.scores$scores,use="pairwise") - f5$Phi  #compare to the f5$Phi values
#compare the default (regression) score correlations to the factor correlations
cor(f5$scores,use="pairwise")  - f5$Phi
#compare to the f5 solution




