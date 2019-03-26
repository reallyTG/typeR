library(mixlm)


### Name: simple.glht
### Title: Pairwise comparison with multiple testing compensation.
### Aliases: simple.glht print.simple.glht cld
### Keywords: models design

### ** Examples

require(graphics)

summary(fm1 <- lm(breaks ~ wool + tension, data = warpbreaks))
simple.glht(fm1, "tension")
plot(simple.glht(fm1, "tension"))
cld(simple.glht(fm1, "tension"))



