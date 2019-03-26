library(aurelius)


### Name: extract_params.naiveBayes
### Title: extract_params.naiveBayes
### Aliases: extract_params.naiveBayes

### ** Examples

model <- e1071::naiveBayes(Species ~ ., data=iris) 
model_params <- extract_params(model)



