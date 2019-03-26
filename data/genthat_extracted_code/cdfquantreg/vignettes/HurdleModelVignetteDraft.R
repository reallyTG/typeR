## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- echo = FALSE-------------------------------------------------------
library(cdfquantreg)
library(MASS)

data(cdfqrExampleData)

## ------------------------------------------------------------------------
# Examine effects of format and order for general extinction:
m0 <- cdfquantregC(EQ1_P ~ 1 | 1, fd ='logit',sd ='logistic', c1 = 0.00001818, c2 = 0.1,data = ExtEvent)
m1 <- update(m0, .~. + order + format)
anova(m0, m1)

m2 <- update(m1, .~. |.+ order)
anova(m1, m2)

m3 <- update(m1, .~. |.+ format)
anova(m1, m3)

m4 <- update(m3, .~. + nation|.)
anova(m3, m4)

summary(m4)

## ------------------------------------------------------------------------
cov2cor(vcov(m4))
plot(m4, nbins = 50)


## ---- echo = FALSE-------------------------------------------------------
# Preliminary stuff

gunowndata <- subset(ExtEvent, nation == "US")[, c("political", "SECS_6")]
gunowndata$gunown <- gunowndata$SECS_6/100
gunowndata <- na.omit(gunowndata)
hist(gunowndata$gunown, breaks = 50, xlab = "gun ownership", ylab = "density", main = "", col = "red")
# 

## ------------------------------------------------------------------------
# How many people occupy the political orientation groups in the sample?
table(gunowndata$political)
# 
par(mfrow = c(2,2),mar = c(4,4,1,1))
truehist(gunowndata$gunown[gunowndata$political == "Democrat"], nbins = 50, main = "Democrat", xlab = "gun ownership", ylab = "density", ylim = c(0,11), col = "red")
truehist(gunowndata$gunown[gunowndata$political == "Independent"], nbins = 50, main = "Independent", xlab = "gun ownership", ylab = "density", ylim = c(0,11), col = "red")
truehist(gunowndata$gunown[gunowndata$political == "NoPref"], nbins = 50, main = "No Preference", xlab = "gun ownership", ylab = "density", ylim = c(0,11), col = "red")
truehist(gunowndata$gunown[gunowndata$political == "Republican"], nbins = 50, main = "Republican", xlab = "gun ownership", ylab = "density", ylim = c(0,11), col = "red")

## ------------------------------------------------------------------------
mod0 <- cdfquantregH(gunown ~ 1, zero.fo = ~1, one.fo = ~1, fd = 'burr8', sd = 'burr8', type = 'ZO', data = gunowndata)
mod1 <- cdfquantregH(gunown ~ political, zero.fo = ~1, one.fo = ~1, fd = 'burr8', sd = 'burr8', type = 'ZO', data = gunowndata)
mod2 <- cdfquantregH(gunown ~ political|political, zero.fo = ~1, one.fo = ~1, fd = 'burr8', sd = 'burr8', type = 'ZO', data = gunowndata)
mod3 <- cdfquantregH(gunown ~ political, zero.fo = ~political, one.fo = ~political, fd = 'burr8', sd = 'burr8', type = 'ZO', data = gunowndata)


anova(mod1,mod3)
summary(mod3)

