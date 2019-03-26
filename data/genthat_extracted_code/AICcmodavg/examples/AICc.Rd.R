library(AICcmodavg)


### Name: AICc
### Title: Computing AIC, AICc, QAIC, and QAICc
### Aliases: AICc AICc.default AICc.aov AICc.betareg AICc.clm AICc.clmm
###   AICc.coxme AICc.coxph AICc.fitdist AICc.fitdistr AICc.glm AICc.gls
###   AICc.gnls AICc.hurdle AICc.lavaan AICc.lm AICc.lme AICc.lmekin
###   AICc.maxlikeFit AICc.mer AICc.merMod AICc.multinom AICc.nlme AICc.nls
###   AICc.polr AICc.rlm AICc.survreg AICc.unmarkedFit AICc.vglm
###   AICc.zeroinfl
### Keywords: models

### ** Examples

##cement data from Burnham and Anderson (2002, p. 101)
data(cement)
##run multiple regression - the global model in Table 3.2
glob.mod <- lm(y ~ x1 + x2 + x3 + x4, data = cement)

##compute AICc with full likelihood
AICc(glob.mod, return.K = FALSE)

##compute AIC with full likelihood 
AICc(glob.mod, return.K = FALSE, second.ord = FALSE)
##note that Burnham and Anderson (2002) did not use full likelihood
##in Table 3.2 and that the MLE estimate of the variance was
##rounded to 2 digits after decimal point  


##compute AICc for mixed model on Orthodont data set in Pinheiro and
##Bates (2000)
## Not run: 
##D require(nlme)
##D m1 <- lme(distance ~ age, random = ~1 | Subject, data = Orthodont,
##D           method= "ML")
##D AICc(m1, return.K = FALSE)
## End(Not run)




