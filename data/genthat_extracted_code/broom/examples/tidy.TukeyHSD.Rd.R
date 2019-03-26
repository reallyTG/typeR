library(broom)


### Name: tidy.TukeyHSD
### Title: Tidy a(n) TukeyHSD object
### Aliases: tidy.TukeyHSD

### ** Examples


fm1 <- aov(breaks ~ wool + tension, data = warpbreaks)
thsd <- TukeyHSD(fm1, "tension", ordered = TRUE)
tidy(thsd)

# may include comparisons on multiple terms
fm2 <- aov(mpg ~ as.factor(gear) * as.factor(cyl), data = mtcars)
tidy(TukeyHSD(fm2))




