library(Causata)


### Name: SampleStratified
### Title: Draws a random, stratified sample from a vector of indices.
### Aliases: SampleStratified

### ** Examples

data(df.causata)
idx <- SampleStratified(df.causata$has.responded.mobile.logoff_next.hour_466=="true")
table(df.causata$has.responded.mobile.logoff_next.hour_466, idx)



