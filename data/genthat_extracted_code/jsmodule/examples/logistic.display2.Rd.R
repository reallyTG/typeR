library(jsmodule)


### Name: logistic.display2
### Title: logistic.display2: Modified epiDisplay's logistic.display
###   function.
### Aliases: logistic.display2

### ** Examples

model1 <- glm(am ~ cyl + disp, data = mtcars, family = binomial)
logistic.display2(model1, crude = TRUE, crude.p.value = TRUE, decimal = 3)



