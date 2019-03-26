library(oce)


### Name: subset,cm-method
### Title: Subset a CM Object
### Aliases: subset,cm-method

### ** Examples

library(oce)
data(cm)
plot(cm)
plot(subset(cm, time < mean(range(cm[['time']]))))




