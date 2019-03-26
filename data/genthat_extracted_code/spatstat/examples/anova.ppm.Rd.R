library(spatstat)


### Name: anova.ppm
### Title: ANOVA for Fitted Point Process Models
### Aliases: anova.ppm
### Keywords: spatial models methods

### ** Examples

 mod0 <- ppm(swedishpines ~1)
 modx <- ppm(swedishpines ~x)
 # Likelihood ratio test
 anova(mod0, modx, test="Chi")
 # Score test
 anova(mod0, modx, test="Rao")

 # Single argument
 modxy <- ppm(swedishpines ~x + y)
 anova(modxy, test="Chi")

 # Adjusted composite likelihood ratio test
 modP <- ppm(swedishpines ~1, rbord=9)
 modS <- ppm(swedishpines ~1, Strauss(9))
 anova(modP, modS, test="Chi")



