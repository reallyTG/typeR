library(LogisticDx)


### Name: plot.glm
### Title: Plot diagnostics for a binomial 'glm' model
### Aliases: plot.glm
### Keywords: hplot

### ** Examples

## H&L 2nd ed. Table 4.9. Figures 5.5-5.8. Pages 177-180.
data(uis)
uis <- within(uis, {
    NDRGFP1 <- 10 / (NDRGTX + 1)
    NDRGFP2 <- NDRGFP1 * log((NDRGFP1 + 1) / 10)
})
summary(g1 <- glm(DFREE ~ AGE + NDRGFP1 + NDRGFP2 + IVHX +
                  RACE + TREAT + SITE +
                  AGE:NDRGFP1 + RACE:SITE,
                  family=binomial, data=uis))
plot(g1)
## H&L. Similar to Figure 5.3.
set.seed(133)
(g1 <- glm(sample(c(0, 1), size=100,
                  replace=TRUE, prob=c(0.5, 0.5))
           ~ 0 + I(0.08 * rnorm(n=100, mean=0, sd=sqrt(9))),
           family=binomial))$coef # approx. 0.8
plot(g1)



