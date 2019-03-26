library(lavaan)


### Name: lavTestLRT
### Title: LRT test
### Aliases: lavTestLRT lavtestLRT LRT lavLRTTest lavLRT anova

### ** Examples

HS.model <- '
    visual  =~ x1 + b1*x2 + x3
    textual =~ x4 + b2*x5 + x6
    speed   =~ x7 + b3*x8 + x9
'
fit1 <- cfa(HS.model, data = HolzingerSwineford1939)
fit0 <- cfa(HS.model, data = HolzingerSwineford1939, 
            orthogonal = TRUE)
lavTestLRT(fit1, fit0)



