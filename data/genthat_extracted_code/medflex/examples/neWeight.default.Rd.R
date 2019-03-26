library(medflex)


### Name: neWeight.default
### Title: Expand the dataset and calculate ratio-of-mediator probability
###   weights
### Aliases: neWeight.default

### ** Examples

data(UPBdata)

## example using glm
fit.glm <- glm(negaff ~ att + gender + educ + age, data = UPBdata)
weightData <- neWeight(fit.glm, nRep = 2)
## Don't show: 
library(VGAM) 
fit1 <- glm(negaff ~ att + gender + educ + age, data = UPBdata)
expData1 <- neWeight(fit1)
w1 <- attr(expData1, "weights")
expData1f <- neWeight(negaff ~ att + gender + educ + age, data = UPBdata)
w1f <- attr(expData1f, "weights")
head(expData1); head(expData1f)
head(w1); head(w1f)

##

UPBdata$negaff2 <- cut(UPBdata$negaff, breaks = 2, labels = c("low", "high"))
fit2 <- glm(negaff2 ~ att + gender + educ + age, family = binomial, data = UPBdata)
expData2 <- neWeight(fit2)
w2 <- attr(expData2, "weights")
expData2f <- neWeight(negaff2 ~ att + gender + educ + age, family = binomial, data = UPBdata)
w2f <- attr(expData2f, "weights")
head(expData2); head(expData2f)
head(w2); head(w2f)

# test vglm
fit2b <- vgam(negaff2 ~ att + gender + educ + age, family = binomialff, data = UPBdata)
expData2b <- neWeight(fit2b)
head(attr(expData2, "weights")); head(attr(expData2b, "weights"))
fit2b <- vgam(negaff2 ~ s(att) + gender + educ + age, family = binomialff, data = UPBdata)
expData2b <- neWeight(fit2b)
head(attr(expData2, "weights")); head(attr(expData2b, "weights"))
expData2bf <- neWeight(negaff2 ~ s(att) + gender + educ + age, FUN = vgam, family = binomialff, data = UPBdata)
head(attr(expData2b, "weights")); head(attr(expData2bf, "weights"))
##

UPBdata$negaff3 <- cut(UPBdata$negaff, breaks = 3, labels = c("low", "moderate", "high"))
UPBdata$negaff3 <- as.numeric(UPBdata$negaff3)
fit3 <- glm(negaff3 ~ att + gender + educ + age, family = "poisson", data = UPBdata)
expData3 <- neWeight(fit3)
w3 <- attr(expData3, "weights")
expData3f <- neWeight(negaff3 ~ att + gender + educ + age, family = poisson, data = UPBdata)
w3f <- attr(expData3f, "weights")
head(expData3); head(expData3f)
head(w3); head(w3f)

# test vglm
fit3b <- vgam(negaff3 ~ att + gender + educ + s(age), family = poissonff, data = UPBdata)
expData3b <- neWeight(fit3b)
head(attr(expData3, "weights")); head(attr(expData3b, "weights"))
fit3b <- vgam(negaff3 ~ s(att) + gender + educ + age, family = poissonff, data = UPBdata)
expData3b <- neWeight(fit3b)
head(attr(expData3, "weights")); head(attr(expData3b, "weights"))
expData3bf <- neWeight(negaff3 ~ s(att) + gender + educ + age, FUN = vgam, family = poissonff, data = UPBdata)
head(attr(expData3b, "weights")); head(attr(expData3bf, "weights"))
## End(Don't show)



