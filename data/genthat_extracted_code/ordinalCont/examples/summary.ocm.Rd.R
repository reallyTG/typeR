library(ordinalCont)


### Name: summary.ocm
### Title: Summarizing Continuous Ordinal Fits
### Aliases: summary.ocm
### Keywords: summary

### ** Examples

fit.overall  <- ocm(overall  ~ cycleno + age + bsa + treatment, data=ANZ0001.sub, scale=c(0,100))
summary(fit.overall)



