library(outreg)


### Name: outreg
### Title: Generate Regression Table
### Aliases: outreg

### ** Examples

fitlist <- list(lm(mpg ~ cyl, data = mtcars),
                lm(mpg ~ cyl + wt + hp, data = mtcars),
                lm(mpg ~ cyl + wt + hp + drat, data = mtcars))
outreg(fitlist)

# with custom regression names
outreg(setNames(fitlist, c('small', 'medium', 'large')))

# star on standard errors, instead of estimate
outreg(fitlist, starred = 'se')

# include other stats
outreg(fitlist, pv = TRUE, tv = TRUE, se = FALSE)


# poisson regression
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
fitlist2 <- list(glm(counts ~ outcome, family = poisson()),
                 glm(counts ~ outcome + treatment, family = poisson()))
outreg(fitlist2)


# logistic regression
fitlist3 <- list(glm(cbind(ncases, ncontrols) ~ agegp,
                     data = esoph, family = binomial()),
                 glm(cbind(ncases, ncontrols) ~ agegp + tobgp + alcgp,
                     data = esoph, family = binomial()),
                 glm(cbind(ncases, ncontrols) ~ agegp + tobgp * alcgp,
                     data = esoph, family = binomial()))
outreg(fitlist3)


# survival regression
library(survival)
fitlist4 <- list(survreg(Surv(time, status) ~ ph.ecog + age,
                         data = lung),
                 survreg(Surv(time, status) ~ ph.ecog + age + strata(sex),
                         data = lung))
outreg(fitlist4)


# tobit regression
fitlist5 <- list(survreg(Surv(durable, durable>0, type='left') ~ 1,
                 data=tobin, dist='gaussian'),
                 survreg(Surv(durable, durable>0, type='left') ~ age + quant,
                 data=tobin, dist='gaussian'))
outreg(fitlist5)


# instrumental variable regression
library(AER)
data("CigarettesSW", package = "AER")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)

fitlist6 <- list(OLS = lm(log(packs) ~ log(rprice) + log(rincome),
                          data = CigarettesSW, subset = year == "1995"),
                 IV1 = ivreg(log(packs) ~ log(rprice) + log(rincome) |
                             log(rincome) + tdiff + I(tax/cpi),
                             data = CigarettesSW, subset = year == "1995"),
                 IV2 = ivreg(log(packs) ~ log(rprice) + log(rincome) |
                             log(population) + tdiff + I(tax/cpi),
                             data = CigarettesSW, subset = year == "1995"))
outreg(fitlist6)




