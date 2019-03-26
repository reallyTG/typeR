library(phenofit)


### Name: getRealDate
### Title: getRealDate
### Aliases: getRealDate

### ** Examples

library(phenofit)
data("MOD13A1")

df  <- MOD13A1$dt
df$t <- getRealDate(df$date, df$DayOfYear)



