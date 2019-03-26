library(Fahrmeir)


### Name: caesar
### Title: Caesarian Birth Study
### Aliases: caesar
### Keywords: datasets

### ** Examples

summary(caesar)
caesar.glm1 <- glm(yl ~ noplan+factor+antib, data=caesar, weight=w, 
                       family=binomial(link="logit"))
caesar.glm2 <- glm(yl ~ noplan+factor+antib, data=caesar, weight=w, 
                   family=binomial(link="probit"))
summary(caesar.glm1)
summary(caesar.glm2)



