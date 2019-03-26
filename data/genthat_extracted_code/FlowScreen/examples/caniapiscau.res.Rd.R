library(FlowScreen)


### Name: caniapiscau.res
### Title: Screening results for the Caniapiscau River
### Aliases: caniapiscau.res
### Keywords: datasets

### ** Examples

# Code used produce this data set:
## Not run: 
##D data(caniapiscau)
##D caniapiscau.ts <- create.ts(caniapiscau, hyrstart=3)
##D caniapiscau.ts <- subset(caniapiscau.ts, caniapiscau.ts$hyear > 1962)
##D caniapiscau.res <- metrics.all(caniapiscau.ts)
## End(Not run)
# example use of example subset flow series
data(caniapiscau.res)



