library(cdfquantreg)


### Name: anova.cdfqr
### Title: Model comparison test for fitted cdfqr models
### Aliases: anova.cdfqr anova.cdfqrH

### ** Examples

data(cdfqrExampleData)
fit_null <- cdfquantreg(crc99 ~ 1 | 1, 't2','t2', data = JurorData)
fit_mod1 <- cdfquantreg(crc99 ~ vert | confl, 't2','t2', data = JurorData)
anova(fit_null, fit_mod1)




