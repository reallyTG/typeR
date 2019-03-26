library(aurelius)


### Name: extract_params.knnreg
### Title: extract_params.knnreg
### Aliases: extract_params.knnreg

### ** Examples

model <- caret::knnreg(mpg ~ cyl + hp + am + gear + carb, data = mtcars)
extracted_params <- extract_params(model)



