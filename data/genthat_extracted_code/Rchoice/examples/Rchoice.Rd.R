library(Rchoice)


### Name: Rchoice
### Title: Estimate discrete choice model with random parameters
### Aliases: Rchoice coef.Rchoice df.residual.Rchoice fitted.Rchoice
###   logLik.Rchoice model.matrix.Rchoice nObs.Rchoice ordinal
###   print.Rchoice print.summary.Rchoice residuals.Rchoice summary.Rchoice
###   terms.Rchoice update.Rchoice

### ** Examples

## Probit model
data("Workmroz")
probit <- Rchoice(lfp ~ k5 + k618 + age + wc + hc + lwg + inc,  
                 data = Workmroz, family = binomial('probit'))
summary(probit)

## Poisson model
data("Articles")
poisson <- Rchoice(art ~ fem + mar + kid5 + phd + ment, data = Articles, family = poisson)
summary(poisson)

## Ordered probit model
data("Health")
oprobit <- Rchoice(newhsat ~ age + educ + hhinc + married + hhkids, 
data = Health, family = ordinal('probit'), subset = year == 1988)
summary(oprobit)

## Poisson Model with Random Parameters
## Not run: 
##D poisson.ran <- Rchoice(art ~ fem + mar + kid5 + phd + ment, 
##D                        data = Articles,  family = poisson,
##D                        ranp = c(kid5 = "n", phd = "n", ment = "n"))
##D summary(poisson.ran)                      
##D 
##D ## Poisson Model with Correlated Random Parameters
##D poissonc.ran <- Rchoice(art ~ fem + mar + kid5 + phd + ment, 
##D                        data = Articles, 
##D                        ranp = c(kid5 = "n", phd = "n", ment = "n"), 
##D                        family = poisson, 
##D                        correlation =  TRUE)
##D summary(poissonc.ran)
##D 
##D ## Hierarchical Poisson Model
##D poissonH.ran <- Rchoice(art ~ fem + mar + kid5 + phd + ment | fem + phd,
##D                        data = Articles,
##D                        ranp = c(kid5 = "n", phd = "n", ment = "n"),
##D                        mvar = list(phd = c("fem"), ment = c("fem", "phd")),
##D                        family = poisson,
##D                        R = 10)
##D summary(poissonH.ran)
##D 
##D ## Probit Model with Random Effects and Random Parameters
##D data('Unions', package = 'pglm')
##D Unions$lwage <- log(Unions$wage)
##D union.ran <- Rchoice(union ~ age + exper + rural + lwage,
##D                      data = Unions[1:2000, ],
##D                      family = binomial('probit'),
##D                      ranp = c(constant = "n", lwage = "t"),
##D                      R = 10,
##D                      panel = TRUE,
##D                      index = "id",
##D                      print.init = TRUE)
##D summary(union.ran)
##D 
##D ## Ordered Probit Model with Random Effects and Random Parameters
##D oprobit.ran <- Rchoice(newhsat ~ age + educ + married + hhkids + linc,
##D                      data = Health[1:2000, ],
##D                      family = ordinal('probit'),
##D                      ranp = c(constant = "n", hhkids = "n", linc = "n"),
##D                      panel = TRUE,
##D                      index = "id",
##D                      R = 100,
##D                      print.init = TRUE)
##D summary(oprobit.ran)
## End(Not run) 





