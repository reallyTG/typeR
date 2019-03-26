library(tsDyn)


### Name: resVar
### Title: Residual variance
### Aliases: resVar
### Keywords: ts

### ** Examples

#Lynx model as in Tong (1980, p. 387)
mod.setar <- setar(log10(lynx), mL=7,mH=2, thDelay=1, th=3.116)
summary(mod.setar)
#coefficients are same for lower regime but differ for higer

resVar(mod.setar, adj="ML")
#variance or the residuals is same for lower regime but differ for higer regime and hence for total

#Lynx model as in Tong (1980, p. 405)
mod.setar2 <- setar(log10(lynx), mL=1,mM=7,mH=2, thDelay=1, nthresh=2,th=c(2.373, 3.154))
round(coefficients(mod.setar2),3)

resVar(mod.setar2, adj="ML")





