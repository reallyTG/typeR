library(metaLik)


### Name: summary.metaLik
### Title: Summarizing meta-analysis and meta-regression model fits
### Aliases: summary.metaLik
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



