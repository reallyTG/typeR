library(SVMMaj)


### Name: roccurve
### Title: Plot the ROC curve of the predicted values
### Aliases: roccurve

### ** Examples

model <- svmmaj(diabetes$X, diabetes$y)
roccurve(model$q)



