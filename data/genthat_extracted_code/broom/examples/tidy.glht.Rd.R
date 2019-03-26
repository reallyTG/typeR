library(broom)


### Name: tidy.glht
### Title: Tidy a(n) glht object
### Aliases: tidy.glht multcomp_tidiers

### ** Examples


if (require("multcomp") && require("ggplot2")) {

    library(multcomp)
    library(ggplot2)
    
    amod <- aov(breaks ~ wool + tension, data = warpbreaks)
    wht <- glht(amod, linfct = mcp(tension = "Tukey"))

    tidy(wht)
    ggplot(wht, aes(lhs, estimate)) + geom_point()

    CI <- confint(wht)
    tidy(CI)
    ggplot(CI, aes(lhs, estimate, ymin = lwr, ymax = upr)) +
       geom_pointrange()

    tidy(summary(wht))
    ggplot(mapping = aes(lhs, estimate)) +
       geom_linerange(aes(ymin = lwr, ymax = upr), data = CI) +
       geom_point(aes(size = p), data = summary(wht)) +
       scale_size(trans = "reverse")

    cld <- cld(wht)
    tidy(cld)
}




