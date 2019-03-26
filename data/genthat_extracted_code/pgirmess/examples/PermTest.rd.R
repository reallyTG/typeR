library(pgirmess)


### Name: PermTest
### Title: Permutation test for lm, lme and glm (binomial and Poisson)
###   objects
### Aliases: PermTest PermTest.lm PermTest.lme PermTest.glm print.PermTest
### Keywords: htest

### ** Examples


library(MASS)
mylm<-lm(Postwt~Prewt,data=anorexia)
PermTest(mylm,B=250)


## Dobson (1990) Page 93: Randomized Controlled Trial :
    counts <- c(18,17,15,20,10,20,25,13,12)
    outcome <- gl(3,1,9)
    treatment <- gl(3,3)
    glm.D93 <- glm(counts ~ outcome + treatment, family=poisson)
    PermTest(glm.D93,B=100)

library(nlme)
fm2 <- lme(distance ~ age + Sex, data = Orthodont, random = ~ 1)
PermTest(fm2,B=100)


  


