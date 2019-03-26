library(metaLik)


### Name: metaLik
### Title: First- and higher-order likelihood inference in meta-analysis
###   and meta-regression models
### Aliases: metaLik
### Keywords: regression htest

### ** Examples

## meta-analysis
data(education)
m <- metaLik(y~1, data=education, sigma2=sigma2)
summary(m)
## meta-analysis
data(albumin)
m <- metaLik(y~1, data=albumin, sigma2=sigma2)
summary(m)
## meta-regression  
data(vaccine)
m <- metaLik(y~latitude, data=vaccine, sigma2=sigma2)
summary(m)
## meta-regression
data(cholesterol)
m <- metaLik(heart_disease~chol_reduction, data=cholesterol, weights=1/sigma2)
summary(m)



