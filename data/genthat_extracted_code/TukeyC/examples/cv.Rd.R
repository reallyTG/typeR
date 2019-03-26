library(TukeyC)


### Name: cv
### Title: Coefficient of the experiment variation
### Aliases: cv
### Keywords: univar aov coefficient of variation

### ** Examples

library(TukeyC)

## Completely Randomized Design (CRD - aov) 
data(CRD1)
av1 <- with(CRD1,
            aov(y ~ x,
                data=dfm))
summary(av1)
cv(av1)

## Randomized Complete Block Design (RCBD - aov)
data(RCBD)
av2 <- with(RCBD,
            aov(y ~ blk + tra,
                data=dfm))
summary(av2)
cv(av2)

## Split-plot experiment (SPE - aovlist)
data(SPE)
av3 <- with(SPE,
            aov(y ~ blk + P*SP + Error(blk/P),
                data=dfm))
summary(av3)
cv(av3)

## Split-split-plot experiment (SSPE - aovlist)
data(SSPE)
av4 <- with(SSPE,
            aov(y ~  blk + P*SP*SSP + Error(blk/P/SP),
                data=dfm))
summary(av4)
cv(av4)

## storing
res <- cv(av4)
res[2:3]



