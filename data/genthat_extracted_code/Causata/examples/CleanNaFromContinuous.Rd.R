library(Causata)


### Name: CleanNaFromContinuous
### Title: Replaces missing values in an array of numeric values.
### Aliases: CleanNaFromContinuous CleanNaFromContinuous.numeric
###   CleanNaFromContinuous.POSIXct

### ** Examples

# numeric, median is 2, mean is 3.7
x <- c(NA, 1,1.5,2,3,11)
CleanNaFromContinuous(x)



