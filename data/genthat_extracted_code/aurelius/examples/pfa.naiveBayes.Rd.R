library(aurelius)


### Name: pfa.naiveBayes
### Title: PFA Formatting of Fitted naiveBayess
### Aliases: pfa.naiveBayes

### ** Examples

model <- e1071::naiveBayes(Species ~ ., data=iris) 
model_as_pfa <- pfa(model)



