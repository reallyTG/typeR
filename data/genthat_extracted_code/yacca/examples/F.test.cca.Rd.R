library(yacca)


### Name: F.test.cca
### Title: F Test for Canonical Correlations Using Rao's Approximation
### Aliases: F.test.cca print.F.test.cca
### Keywords: htest multivariate

### ** Examples

#Example: perceived personal attributes versus professional performance
#for US Judges
data(USJudgeRatings)
personal <- USJudgeRatings[,c("INTG","DMNR","DILG","FAMI","PHYS")]
performance <- USJudgeRatings[,c("CFMG","DECI","PREP","ORAL","WRIT")]
cca.fit <- cca(personal, performance)

#Test the canonical correlations (see also summary(cca.fit))
F.test.cca(cca.fit)



