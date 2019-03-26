library(BAS)


### Name: variable.names.pred.bas
### Title: Extract the variable names for a model from a BAS prediction
###   object
### Aliases: variable.names.pred.bas variable.names

### ** Examples

data(Hald)
hald.gprior =  bas.lm(Y~ ., data=Hald, prior="ZS-null", modelprior=uniform())
hald.bpm = predict(hald.gprior, newdata=Hald[1,],
                   se.fit=TRUE,
                   estimator="BPM")
variable.names(hald.bpm)



