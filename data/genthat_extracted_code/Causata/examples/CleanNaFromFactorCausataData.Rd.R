library(Causata)


### Name: CleanNaFromFactor.CausataData
### Title: Given a factor in a CausataData object, this replaces missing
###   values.
### Aliases: CleanNaFromFactor.CausataData

### ** Examples

df <- data.frame(f1__AP=factor(c("a","b",NA)), f2__AP=factor(c("x","y",NA)))
causataData <- CausataData(df, rep(0,nrow(df)))
causataData <- CleanNaFromFactor(causataData)



