library(LogisticDx)


### Name: dx
### Title: Diagnostics for binomial regression
### Aliases: dx dx.glm

### ** Examples

## H&L 2nd ed. Table 5.8. Page 182.
## Pattern nos. 31, 477, 468
data(uis)
uis <- within(uis, {
    NDRGFP1 <- 10 / (NDRGTX + 1)
    NDRGFP2 <- NDRGFP1 * log((NDRGTX + 1) / 10)
})
(d1 <- dx(g1 <- glm(DFREE ~ AGE + NDRGFP1 + NDRGFP2 + IVHX +
                    RACE + TREAT + SITE +
                    AGE:NDRGFP1 + RACE:SITE,
                    family=binomial, data=uis)))
d1[519:521, ]



