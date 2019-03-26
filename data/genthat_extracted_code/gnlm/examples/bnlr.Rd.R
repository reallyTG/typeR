library(gnlm)


### Name: bnlr
### Title: Binomial Nonlinear Regression Models
### Aliases: bnlr
### Keywords: models

### ** Examples


# assay to estimate LD50
y <- c(9,9,10,4,1,0,0)
y <- cbind(y,10-y)
dose <- log10(100/c(2.686,2.020,1.520,1.143,0.860,0.647,0.486))

summary(glm(y~dose, family=binomial))
bnlr(y, mu=~dose, pmu=c(1,1))
summary(glm(y~dose, family=binomial(link=probit)))
bnlr(y, link="probit", mu=~dose, pmu=c(1,1))
## Not run: 
##D bnlr(y, link="log log", mu=~dose, pmu=c(1,1))
##D bnlr(y, link="comp log log", mu=~dose, pmu=c(1,1))
##D bnlr(y, link="Cauchy", mu=~dose, pmu=c(60,-30))
##D bnlr(y, link="Student", mu=~dose, pmu=c(60,-30), pshape=0.1)
##D bnlr(y, link="stable", mu=~dose, pmu=c(20,-15), pshape=0, stepmax=1)
##D bnlr(y, link="mixture", mu=~dose, pmu=c(60,-30), pshape=-2.5)
##D #
##D mu <- function(p) -p[1]*(log10(p[2])-dose)
##D bnlr(y, mu=mu, pmu=c(1,100))
##D bnlr(y, link="probit", mu=mu, pmu=c(1,100))
## End(Not run)



