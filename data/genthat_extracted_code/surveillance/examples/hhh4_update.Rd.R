library(surveillance)


### Name: hhh4_update
### Title: 'update' a fitted '"hhh4"' model
### Aliases: update.hhh4
### Keywords: models methods

### ** Examples

data("salmonella.agona")
## convert to sts class
salmonella <- disProg2sts(salmonella.agona)

## fit a basic model
fit0 <- hhh4(salmonella,
            list(ar = list(f = ~1), end = list(f = addSeason2formula(~t))))

## update: Poisson -> NegBin1, component seasonality
fit1 <- update(fit0, family = "NegBin1", S = list(end=2, ar=2))

## compare fits
AIC(fit0, fit1)
opar <- par(mfrow=c(2,2))
plot(fit0, type="fitted", names="fit0", par.settings=NULL)
plot(fit1, type="fitted", names="fit1", par.settings=NULL)
plot(fit0, fit1, type="season", components=c("end", "ar"), par.settings=NULL)
par(opar)



