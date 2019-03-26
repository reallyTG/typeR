library(surveillance)


### Name: glm_epidataCS
### Title: Fit an Endemic-Only 'twinstim' as a Poisson-'glm'
### Aliases: glm_epidataCS
### Keywords: models

### ** Examples

data("imdepi", "imdepifit")

## Fit an endemic-only twinstim() and an equivalent model wrapped in glm()
fit_twinstim <- update(imdepifit, epidemic = ~0, siaf = NULL, subset = NULL,
                       optim.args=list(control=list(trace=0)), verbose=FALSE)
fit_glm <- glm_epidataCS(formula(fit_twinstim)$endemic, data = imdepi)

## Compare the coefficients
cbind(twinstim = coef(fit_twinstim), glm = coef(fit_glm))
## Don't show: 
stopifnot(all.equal(coef(fit_glm), coef(fit_twinstim),
                    tolerance = 1e-6, check.attributes = FALSE))
if (surveillance.options("allExamples")) {
    ## also check type-specific model:
    stopifnot(all.equal(
        coef(glm_epidataCS(~0+type, imdepi)),
        coef(update(fit_twinstim, endemic=~(1|type))),
    tolerance = 1e-6, check.attributes = FALSE))
}
## End(Don't show)

### also compare to an equivalent endemic-only hhh4() fit

## first need to aggregate imdepi into an "sts" object
load(system.file("shapes", "districtsD.RData", package="surveillance"))
imdsts <- epidataCS2sts(imdepi, freq = 12, start = c(2002, 1),
                        neighbourhood = NULL, tiles = districtsD,
                        popcol.stgrid = "popdensity")

## determine the correct offset to get an equivalent model
offset <- 2 * rep(with(subset(imdepi$stgrid, !duplicated(BLOCK)),
                  stop - start), ncol(imdsts)) *
          sum(districtsD$POPULATION) * population(imdsts)

## fit the model using hhh4()
fit_hhh4 <- hhh4(imdsts, control = list(
    end = list(
        f = addSeason2formula(~I(start/365-3.5), period=365, timevar="start"),
        offset = offset
    ), family = "Poisson", subset = 1:nrow(imdsts),
    data = list(start=with(subset(imdepi$stgrid, !duplicated(BLOCK)), start))))

summary(fit_hhh4)
stopifnot(all.equal(coef(fit_hhh4), coef(fit_glm), check.attributes=FALSE))



