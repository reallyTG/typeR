library(multiCA)


### Name: multiCA.test
### Title: Multinomial Cochran-Armitage trend test
### Aliases: multiCA.test multiCA.test.default multiCA.test.formula
### Keywords: nonparametric

### ** Examples


data(stroke)
## using formula interface
multiCA.test(Type ~ Year, weights=Freq, data=stroke)

##using Westfall's multiple testing adjustment
multiCA.test(Type ~ Year, weights=Freq, data=stroke, p.adjust.method="Westfall")

## using matrix interface and testing only the first 3 outcomes
strk.mat <- xtabs(Freq ~ Type + Year, data=stroke)
multiCA.test(strk.mat, outcomes=1:3)




