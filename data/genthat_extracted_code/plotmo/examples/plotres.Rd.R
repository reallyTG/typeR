library(plotmo)


### Name: plotres
### Title: Plot the residuals of a regression model
### Aliases: plotres
### Keywords: partial dependence regression

### ** Examples

# we use lm in this example, but plotres is more useful for models
# that don't have a function like plot.lm for plotting residuals

lm.model <- lm(Volume~., data=trees)

plotres(lm.model)



