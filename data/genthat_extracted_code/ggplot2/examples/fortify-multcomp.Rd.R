library(ggplot2)


### Name: fortify-multcomp
### Title: Fortify methods for objects produced by 'multcomp'
### Aliases: fortify-multcomp fortify.glht fortify.confint.glht
###   fortify.summary.glht fortify.cld
### Keywords: internal

### ** Examples

if (require("multcomp")) {
amod <- aov(breaks ~ wool + tension, data = warpbreaks)
wht <- glht(amod, linfct = mcp(tension = "Tukey"))

fortify(wht)
ggplot(wht, aes(lhs, estimate)) + geom_point()

CI <- confint(wht)
fortify(CI)
ggplot(CI, aes(lhs, estimate, ymin = lwr, ymax = upr)) +
   geom_pointrange()

fortify(summary(wht))
ggplot(mapping = aes(lhs, estimate)) +
   geom_linerange(aes(ymin = lwr, ymax = upr), data = CI) +
   geom_point(aes(size = p), data = summary(wht)) +
   scale_size(trans = "reverse")

cld <- cld(wht)
fortify(cld)
}



