library(spatstat)


### Name: residuals.mppm
### Title: Residuals for Point Process Model Fitted to Multiple Point
###   Patterns
### Aliases: residuals.mppm
### Keywords: spatial models

### ** Examples

    fit <- mppm(Bugs ~ x, hyperframe(Bugs=waterstriders))
    r <- residuals(fit)
    # compute total residual for each point pattern
    rtot <- sapply(r, integral.msr)
    # standardise the total residuals
    areas <- sapply(windows.mppm(fit), area.owin)
    rtot/sqrt(areas)



