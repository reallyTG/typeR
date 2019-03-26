library(metafor)


### Name: dat.mcdaniel1994
### Title: Studies on the Validity of Employment Interviews
### Aliases: dat.mcdaniel1994
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.mcdaniel1994))

### calculate r-to-z transformed correlations and corresponding sampling variances
dat <- escalc(measure="ZCOR", ri=ri, ni=ni, data=dat)
dat

### meta-analysis of the transformed correlations using a random-effects model
res <- rma(yi, vi, data=dat)
res

### average correlation with 95% CI
predict(res, transf=transf.ztor)

### mixed-effects model with interview type as factor
### note: job-related interviews is the reference level
rma(yi, vi, mods = ~ factor(type), data=dat)

### mixed-effects model with interview structure as factor
### note: structured interviews is the reference level
rma(yi, vi, mods = ~ factor(struct), data=dat)

### note: the interpretation of the results is difficult since all 
### situational interviews were structured, almost all psychological 
### interviews were unstructured, and actually for the majority of 
### the psychological interviews it was unknown whether the interview 
### was structured or unstructured
table(dat$type, dat$struct, useNA="always")

### meta-analysis of raw correlations using a random-effects model
res <- rma(measure="COR", ri=ri, ni=ni, data=dat.mcdaniel1994)
res



