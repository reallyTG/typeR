library(LogisticDx)


### Name: gof
### Title: Goodness of fit tests for binomial regression
### Aliases: gof gof.glm
### Keywords: htest

### ** Examples

## H&L 2nd ed. Sections 5.2.2, 5.2.4, 5.2.5. Pages 147-167.
data(uis)
uis <- within(uis, {
    NDRGFP1 <- 10 / (NDRGTX + 1)
    NDRGFP2 <- NDRGFP1 * log((NDRGTX + 1) / 10)
})
g1 <- gof(glm(DFREE ~ AGE + NDRGFP1 + NDRGFP2 + IVHX +
              RACE + TREAT + SITE +
              AGE:NDRGFP1 + RACE:SITE,
              family=binomial, data=uis), plot=FALSE)
g1
unclass(g1)
attributes(g1$gof)



