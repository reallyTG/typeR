library(rlme)


### Name: lmr
### Title: Rank Based Fixed Effect Regression
### Aliases: lmr

### ** Examples


# load schools data
data(schools)

# Fit fixed effects model with lmr
lmr.fit = lmr(y ~ age + sex, data=schools)

summary(lmr.fit)

# Fit with lmr and calculate standard errors
lmr.fit = lmr(y ~ age + sex, data=schools, se=TRUE)

summary(lmr.fit)




