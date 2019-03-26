library(ordinal)


### Name: clm
### Title: Cumulative Link Models
### Aliases: clm
### Keywords: models

### ** Examples


fm1 <- clm(rating ~ temp * contact, data = wine)
fm1 ## print method
summary(fm1)
fm2 <- update(fm1, ~.-temp:contact)
anova(fm1, fm2)

drop1(fm1, test = "Chi")
add1(fm1, ~.+judge, test = "Chi")

fm2 <- step(fm1)
summary(fm2)

coef(fm1)
vcov(fm1)
AIC(fm1)
extractAIC(fm1)
logLik(fm1)
fitted(fm1)

confint(fm1) ## type = "profile"
confint(fm1, type = "Wald")
pr1 <- profile(fm1)
confint(pr1)

## plotting the profiles:
par(mfrow = c(2, 2))
plot(pr1, root = TRUE) ## check for linearity
par(mfrow = c(2, 2))
plot(pr1)
par(mfrow = c(2, 2))
plot(pr1, approx = TRUE)
par(mfrow = c(2, 2))
plot(pr1, Log = TRUE)
par(mfrow = c(2, 2))
plot(pr1, Log = TRUE, relative = FALSE)

## other link functions:
fm4.lgt <- update(fm1, link = "logit") ## default
fm4.prt <- update(fm1, link = "probit")
fm4.ll <- update(fm1, link = "loglog")
fm4.cll <- update(fm1, link = "cloglog")
fm4.cct <- update(fm1, link = "cauchit")
anova(fm4.lgt, fm4.prt, fm4.ll, fm4.cll, fm4.cct)

## structured thresholds:
fm5 <- update(fm1, threshold = "symmetric")
fm6 <- update(fm1, threshold = "equidistant")
anova(fm1, fm5, fm6)

## the slice methods:
slice.fm1 <- slice(fm1)
par(mfrow = c(3, 3))
plot(slice.fm1)
## see more at '?slice.clm'

## Another example:
fm.soup <- clm(SURENESS ~ PRODID, data = soup)
summary(fm.soup)

if(require(MASS)) { ## dropterm, addterm, stepAIC, housing
    fm1 <- clm(rating ~ temp * contact, data = wine)
    dropterm(fm1, test = "Chi")
    addterm(fm1, ~.+judge, test = "Chi")
    fm3 <- stepAIC(fm1)
    summary(fm3)

    ## Example from MASS::polr:
    fm1 <- clm(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
    summary(fm1)
}




