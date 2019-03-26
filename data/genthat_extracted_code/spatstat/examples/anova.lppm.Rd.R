library(spatstat)


### Name: anova.lppm
### Title: ANOVA for Fitted Point Process Models on Linear Network
### Aliases: anova.lppm
### Keywords: spatial models methods

### ** Examples

 X <- runiflpp(10, simplenet)
 mod0 <- lppm(X ~1)
 modx <- lppm(X ~x)
 anova(mod0, modx, test="Chi")



