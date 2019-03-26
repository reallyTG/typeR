library(model4you)


### Name: objfun
### Title: Objective function
### Aliases: objfun objfun.survreg objfun.lm objfun.glm

### ** Examples

## Example taken from ?stats::glm
## Dobson (1990) Page 93: Randomized Controlled Trial :
counts <- c(18,17,15,20,10,20,25,13,12) 
outcome <- gl(3,1,9)
treatment <- gl(3,3)
print(d.AD <- data.frame(treatment, outcome, counts))
glm.D93 <- glm(counts ~ outcome + treatment, family = poisson())
logLik_contributions <- objfun(glm.D93)
sum(logLik_contributions)
logLik(glm.D93)

if(require("survival")) {
  x <- survreg(Surv(futime, fustat) ~ rx, ovarian, dist = "weibull")
  newdata <- ovarian[3:5, ]

  sum(objfun(x))
  x$loglik

  objfun(x, newdata = newdata)
}




