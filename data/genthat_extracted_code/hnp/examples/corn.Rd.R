library(hnp)


### Name: corn
### Title: Corn damage data
### Aliases: corn
### Keywords: datasets

### ** Examples

data(corn)

# Binomial fit
model1 <- glm(cbind(y, m-y) ~ extract, family=binomial,
              data=corn)
anova(model1, test="Chisq")
hnp(model1, pch=4, main="Binomial: Logit",
    xlab="Half-normal scores", ylab="Deviance residuals")

# Quasi-binomial fit
model2 <- glm(cbind(y, m-y) ~ extract, family=quasibinomial,
              data=corn)
anova(model2, test="F")
summary(model2)$dispersion # estimated phi

# half-normal plots
par(mfrow=c(1,2),cex=1.4, cex.main=0.9, pty='s')
hnp(model1, pch=4, main="(a) Binomial; Logit",
    xlab="Half-normal scores", ylab="Deviance residuals")
hnp(model2, pch=4, main="(b) Quasibinomial; Logit",
    xlab="Half-normal scores", ylab="Deviance residuals")

anova(model1, test="Chisq") # binomial model
anova(model2, test="F") # quasi-binomial model
summary(model1) # binomial model
summary(model2) # quasi-binomial model

# now with factor level parameterisation
summary(update(model1,.~.-1))
summary(update(model2,.~.-1))

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)



