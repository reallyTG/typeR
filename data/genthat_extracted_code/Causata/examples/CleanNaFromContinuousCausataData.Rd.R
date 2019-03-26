library(Causata)


### Name: CleanNaFromContinuous.CausataData
### Title: Replaces missing values in an array of numeric values in a
###   CausataData object.
### Aliases: CleanNaFromContinuous.CausataData

### ** Examples

# median of x__AP is 2
df <- data.frame(x__AP=c(NA, 1,1.5,2,3,11), y__AP=c(NA, 1,2,3,4,5))
causataData <- CausataData(df, rep(0, nrow(df)))
causataData <- CleanNaFromContinuous(causataData)



