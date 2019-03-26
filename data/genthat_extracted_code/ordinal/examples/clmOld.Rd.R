library(ordinal)


### Name: clm2
### Title: Cumulative link models
### Aliases: clm2
### Keywords: models

### ** Examples

options(contrasts = c("contr.treatment", "contr.poly"))

## A tabular data set:
(tab26 <- with(soup, table("Product" = PROD, "Response" = SURENESS)))
dimnames(tab26)[[2]] <- c("Sure", "Not Sure", "Guess", "Guess", "Not Sure", "Sure")
dat26 <- expand.grid(sureness = as.factor(1:6), prod = c("Ref", "Test"))
dat26$wghts <- c(t(tab26))

m1 <- clm2(sureness ~ prod, scale = ~prod, data = dat26,
          weights = wghts, link = "logistic")

## print, summary, vcov, logLik, AIC:
m1
summary(m1)
vcov(m1)
logLik(m1)
AIC(m1)
coef(m1)
coef(summary(m1))

## link functions:
m2 <- update(m1, link = "probit")
m3 <- update(m1, link = "cloglog")
m4 <- update(m1, link = "loglog")
m5 <- update(m1, link = "cauchit", start = coef(m1))
m6 <- update(m1, link = "Aranda-Ordaz", lambda = 1)
m7 <- update(m1, link = "Aranda-Ordaz")
m8 <- update(m1, link = "log-gamma", lambda = 1)
m9 <- update(m1, link = "log-gamma")

## nominal effects:
mN1 <-  clm2(sureness ~ 1, nominal = ~ prod, data = dat26,
            weights = wghts, link = "logistic")
anova(m1, mN1)

## optimizer / method:
update(m1, scale = ~ 1, method = "Newton")
update(m1, scale = ~ 1, method = "nlminb")
update(m1, scale = ~ 1, method = "optim")
## Don't show: 
update(m1, scale = ~ 1, method = "model.frame")
update(m1, location = ~.-prod, scale = ~ 1,
       nominal = ~ prod, method = "model.frame")
## End(Don't show)

## threshold functions
mT1 <- update(m1, threshold = "symmetric")
mT2 <- update(m1, threshold = "equidistant")
anova(m1, mT1, mT2)

## Extend example from polr in package MASS:
## Fit model from polr example:
if(require(MASS)) {
    fm1 <- clm2(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
    fm1
    summary(fm1)
    ## With probit link:
    summary(update(fm1, link = "probit"))
    ## Allow scale to depend on Cont-variable
    summary(fm2 <- update(fm1, scale =~ Cont))
    anova(fm1, fm2)
    ## which seems to improve the fit
}

#################################
## It is possible to fit multinomial models (i.e. with nominal
## effects) as the following example shows:
if(require(nnet)) {
    (hous1.mu <- multinom(Sat ~ 1, weights = Freq, data = housing))
    (hous1.clm <- clm2(Sat ~ 1, weights = Freq, data = housing))

    ## It is the same likelihood:
    all.equal(logLik(hous1.mu), logLik(hous1.clm))

    ## and the same fitted values:
    fitHous.mu <-
        t(fitted(hous1.mu))[t(col(fitted(hous1.mu)) == unclass(housing$Sat))]
    all.equal(fitted(hous1.clm), fitHous.mu)

    ## The coefficients of multinom can be retrieved from the clm2-object
    ## by:
    Pi <- diff(c(0, plogis(hous1.clm$xi), 1))
    log(Pi[2:3]/Pi[1])

    ## A larger model with explanatory variables:
    (hous.mu <- multinom(Sat ~ Infl + Type + Cont, weights = Freq, data = housing))
    (hous.clm <- clm2(Sat ~ 1, nominal = ~ Infl + Type + Cont, weights = Freq,
                      data = housing))

    ## Almost the same likelihood:
    all.equal(logLik(hous.mu), logLik(hous.clm))

    ## And almost the same fitted values:
    fitHous.mu <-
        t(fitted(hous.mu))[t(col(fitted(hous.mu)) == unclass(housing$Sat))]
    all.equal(fitted(hous.clm), fitHous.mu)
    all.equal(round(fitted(hous.clm), 5), round(fitHous.mu), 5)
}




