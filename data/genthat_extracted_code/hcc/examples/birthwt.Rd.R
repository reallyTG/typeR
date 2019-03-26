library(hcc)


### Name: birthwt
### Title: Risk Factors Associated with Low Infant Birth Weight
### Aliases: birthwt
### Keywords: datasets

### ** Examples

data(birthwt)
attach(birthwt)
race <- factor(race, labels=c("white","black","other"))
ptd <- factor(ptl >0)
ftv <- factor(ftv)
levels(ftv)[-(1:2)] <- "2+"
bwt <- data.frame(low=factor(low), age, lwt, race, smoke=(smoke>0), ptd, ht=(ht>0), ui=(ui>0), ftv)
birthwt.glm <- glm(low ~ ., family=binomial, data=bwt )
res<-resid(birthwt.glm)
hctest(age, res)



