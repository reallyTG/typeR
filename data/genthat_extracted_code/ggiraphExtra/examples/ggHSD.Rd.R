library(ggiraphExtra)


### Name: ggHSD
### Title: Draw Tukey Honest Significant Differences plot
### Aliases: ggHSD

### ** Examples

require(ggplot2)
fm1 <- aov(breaks ~ wool + tension, data = warpbreaks)
result=TukeyHSD(fm1, "tension", ordered = TRUE)
str(result)
ggHSD(result)



