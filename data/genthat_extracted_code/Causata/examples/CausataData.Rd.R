library(Causata)


### Name: CausataData
### Title: Creates an object of class CausataData for scoring in Causata.
### Aliases: CausataData

### ** Examples

df <- data.frame(f1__AP=factor(c("a","b",NA)), f2__AP=factor(c("x","y",NA)))
causataData <- CausataData(df, rep(0,nrow(df)))



