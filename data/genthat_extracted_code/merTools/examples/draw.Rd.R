library(merTools)


### Name: draw
### Title: Draw a single observation out of an object matching some
###   criteria
### Aliases: draw draw.merMod

### ** Examples

fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
# Random case
draw(fm1, type = "random")
# Average
draw(fm1, type = "average")
# Subset
draw(fm1, type = "average", varList = list("Subject" = "308"))




