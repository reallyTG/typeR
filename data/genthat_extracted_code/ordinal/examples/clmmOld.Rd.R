library(ordinal)


### Name: clmm2
### Title: Cumulative link mixed models
### Aliases: clmm2
### Keywords: models

### ** Examples

options(contrasts = c("contr.treatment", "contr.poly"))

## More manageable data set:
dat <- subset(soup, as.numeric(as.character(RESP)) <=  24)
dat$RESP <- dat$RESP[drop=TRUE]

m1 <- clmm2(SURENESS ~ PROD, random = RESP, data = dat, link="probit",
           Hess = TRUE, method="ucminf", threshold = "symmetric")

m1
summary(m1)
logLik(m1)
vcov(m1)
extractAIC(m1)
anova(m1, update(m1, location = SURENESS ~ 1, Hess = FALSE))
anova(m1, update(m1, random = NULL))

## Use adaptive Gauss-Hermite quadrature rather than the Laplace
## approximation:
update(m1, Hess = FALSE, nAGQ = 3)

## Use standard Gauss-Hermite quadrature:
update(m1, Hess = FALSE, nAGQ = -7)

##################################################################
## Binomial example with the cbpp data from the lme4-package:
if(require(lme4)) {
    cbpp2 <- rbind(cbpp[,-(2:3)], cbpp[,-(2:3)])
    cbpp2 <- within(cbpp2, {
        incidence <- as.factor(rep(0:1, each=nrow(cbpp)))
        freq <- with(cbpp, c(incidence, size - incidence))
    })

    ## Fit with Laplace approximation:
    fm1 <- clmm2(incidence ~ period, random = herd, weights = freq,
                 data = cbpp2, Hess = 1)
    summary(fm1)

    ## Fit with the adaptive Gauss-Hermite quadrature approximation:
    fm2 <- clmm2(incidence ~ period, random = herd, weights = freq,
                 data = cbpp2, Hess = 1, nAGQ = 7)
    summary(fm2)
}




