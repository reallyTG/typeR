library(psych)


### Name: mixedCor
### Title: Find correlations for mixtures of continuous, polytomous, and
###   dichotomous variables
### Aliases: mixedCor mixed.cor
### Keywords: multivariate models

### ** Examples

data(bfi) 
r <- mixedCor(data=bfi[,c(1:5,26,28)])
r
#this is the same as
r <- mixedCor(data=bfi,p=1:5,c=28,d=26)
r #note how the variable order reflects the original order in the data
#compare to raw Pearson
#note that the biserials and polychorics are not attenuated
rp <- cor(bfi[c(1:5,26,28)],use="pairwise")
lowerMat(rp)



