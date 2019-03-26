library(psycho)


### Name: is.standardized
### Title: Check if a dataframe is standardized.
### Aliases: is.standardized

### ** Examples

library(psycho)

df <- psycho::affective
is.standardized(df)

dfZ <- psycho::standardize(df)
is.standardized(dfZ)



