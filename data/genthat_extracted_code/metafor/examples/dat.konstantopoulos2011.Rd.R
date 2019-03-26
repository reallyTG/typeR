library(metafor)


### Name: dat.konstantopoulos2011
### Title: Studies on the Effects of Modified School Calendars on Student
###   Achievement
### Aliases: dat.konstantopoulos2011
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.konstantopoulos2011))

### regular random-effects model
res <- rma(yi, vi, data=dat)
print(res, digits=3)

### regular random-effects model using rma.mv()
res <- rma.mv(yi, vi, random = ~ 1 | study, data=dat)
print(res, digits=3)

### multilevel random-effects model
res.ml <- rma.mv(yi, vi, random = ~ 1 | district/school, data=dat)
print(res.ml, digits=3)

### profile variance components
profile(res.ml)

### multivariate parameterization of the model
res.mv <- rma.mv(yi, vi, random = ~ factor(school) | district, data=dat)
print(res.mv, digits=3)

### tau^2 from multivariate model = sum of the two variance components from the multilevel model
round(sum(res.ml$sigma2), 3)

### rho from multivariate model = intraclass correlation coefficient based on the multilevel model
round(res.ml$sigma2[1] / sum(res.ml$sigma2), 3)



