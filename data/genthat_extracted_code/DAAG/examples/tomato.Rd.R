library(DAAG)


### Name: tomato
### Title: Root weights of tomato plants exposed to 4 different treatments
### Aliases: tomato
### Keywords: datasets

### ** Examples

tomato.aov <- aov(log(weight) ~ trt, data=tomato)
fitted.values(tomato.aov)
summary.lm(tomato.aov)
tomato.aov <- aov(formula = weight ~ trt, data = tomato)
summary.lm(tomato.aov)



