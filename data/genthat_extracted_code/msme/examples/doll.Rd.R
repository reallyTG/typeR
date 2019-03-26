library(msme)


### Name: doll
### Title: Physician smoking and mortality count data
### Aliases: doll
### Keywords: datasets

### ** Examples

data(doll)

i.glog <- irls(deaths ~ smokes + ordered(age),
               family = "binomial",
               link = "logit",
               data = doll,
               m = doll$pyears)
summary(i.glog)

glm.glog <- glm(cbind(deaths, pyears - deaths) ~ 
                smokes + ordered(age),
                data = doll,
                family = binomial)
coef(summary(glm.glog))





