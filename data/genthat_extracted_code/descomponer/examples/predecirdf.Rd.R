library(descomponer)


### Name: predecirdf
### Title: Prediction whit Regression in domain frequency
### Aliases: predecirdf
### Keywords: smooth

### ** Examples

data(PIB)
data(celec)
mod1=rdf(celec,PIB)
newdata=c(100)
predecirdf(mod1,newdata)



