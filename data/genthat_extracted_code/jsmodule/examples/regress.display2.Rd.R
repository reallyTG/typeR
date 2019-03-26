library(jsmodule)


### Name: regress.display2
### Title: regress.display2: modified epiDisplay's regress.display function
### Aliases: regress.display2

### ** Examples

model1 <- glm(mpg ~ cyl + disp + vs, data = mtcars)
regress.display2(model1, crude = TRUE, crude.p.value = TRUE, decimal = 3)



