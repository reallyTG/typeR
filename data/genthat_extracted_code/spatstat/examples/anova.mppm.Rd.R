library(spatstat)


### Name: anova.mppm
### Title: ANOVA for Fitted Point Process Models for Replicated Patterns
### Aliases: anova.mppm
### Keywords: spatial models methods

### ** Examples

 H <- hyperframe(X=waterstriders)
 mod0 <- mppm(X~1, data=H, Poisson())
 modx <- mppm(X~x, data=H, Poisson())
 anova(mod0, modx, test="Chi")

 mod0S <- mppm(X~1, data=H, Strauss(2))
 modxS <- mppm(X~x, data=H, Strauss(2))
 anova(mod0S, modxS, test="Chi")



