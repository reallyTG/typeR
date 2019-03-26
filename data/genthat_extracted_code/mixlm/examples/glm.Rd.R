library(mixlm)


### Name: glm
### Title: Fitting Generalized Linear Models
### Aliases: glm print.glm
### Keywords: models regression

### ** Examples

## Dobson (1990) Page 93: Randomized Controlled Trial :
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
print(d.AD <- data.frame(treatment, outcome, counts))
glm.D93 <- glm(counts ~ outcome + treatment, family=poisson())
anova(glm.D93)

# A Gamma example, from McCullagh & Nelder (1989, pp. 300-2)
clotting <- data.frame(
    u = c(5,10,15,20,30,40,60,80,100),
    lot1 = c(118,58,42,35,27,25,21,19,18),
    lot2 = c(69,35,26,21,18,16,13,12,12))
summary(glm(lot1 ~ log(u), data=clotting, family=Gamma))
summary(glm(lot2 ~ log(u), data=clotting, family=Gamma))

# Mixed model example
dataset   <- data.frame(y=rnorm(8), x=factor(c(rep(1,4),rep(0,4))), z=factor(rep(c(1,0),4)))
if(require(lme4)){
  GLM       <- glm(y  ~ x+r(z), family=gaussian(identity), data=dataset)
  summary(GLM)
  logLik(GLM)
  Anova(GLM,type=3)
}

## Not run: 
##D ## for an example of the use of a terms object as a formula
##D demo(glm.vr)
## End(Not run)


