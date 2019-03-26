library(car)


### Name: boxCoxVariable
### Title: Constructed Variable for Box-Cox Transformation
### Aliases: boxCoxVariable
### Keywords: manip regression

### ** Examples

mod <- lm(interlocks + 1 ~ assets, data=Ornstein)
mod.aux <- update(mod, . ~ . + boxCoxVariable(interlocks + 1))
summary(mod.aux)
# avPlots(mod.aux, "boxCoxVariable(interlocks + 1)")



