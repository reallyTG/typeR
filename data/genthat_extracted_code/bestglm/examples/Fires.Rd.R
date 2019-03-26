library(bestglm)


### Name: Fires
### Title: Forest fires in Montesinho natural park. Standardized inputs.
### Aliases: Fires
### Keywords: datasets

### ** Examples

data(Fires)
names(Fires)
#ANOVA for xyarea is significant at 1.1%.
summary(aov(lburned~xyarea, data=Fires))



