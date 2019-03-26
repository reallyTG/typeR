library(AICcmodavg)


### Name: useBIC
### Title: Computing BIC or QBIC
### Aliases: useBIC useBIC.default useBIC.aov useBIC.betareg useBIC.clm
###   useBIC.clmm useBIC.coxme useBIC.coxph useBIC.fitdist useBIC.fitdistr
###   useBIC.glm useBIC.gls useBIC.gnls useBIC.hurdle useBIC.lavaan
###   useBIC.lm useBIC.lme useBIC.lmekin useBIC.maxlikeFit useBIC.mer
###   useBIC.merMod useBIC.multinom useBIC.nlme useBIC.nls useBIC.polr
###   useBIC.rlm useBIC.survreg useBIC.unmarkedFit useBIC.vglm
###   useBIC.zeroinfl
### Keywords: models

### ** Examples

##cement data from Burnham and Anderson (2002, p. 101)
data(cement)
##run multiple regression - the global model in Table 3.2
glob.mod <- lm(y ~ x1 + x2 + x3 + x4, data = cement)

##compute BIC with full likelihood
useBIC(glob.mod, return.K = FALSE)

##compute BIC for mixed model on Orthodont data set in Pinheiro and
##Bates (2000)
## Not run: 
##D require(nlme)
##D m1 <- lme(distance ~ age, random = ~1 | Subject, data = Orthodont,
##D           method= "ML")
##D useBIC(m1, return.K = FALSE)
## End(Not run)




