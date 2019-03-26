library(tframe)


### Name: tbind
### Title: Bind Time Series
### Aliases: tbind tbind.default tbind.ts
### Keywords: programming utilities ts

### ** Examples

tbind(    ts(matrix(rnorm(24),24,1), start=c(1986,1), frequency=4),
    ts(matrix(rnorm(6),  6,1), start=c(1986,1), frequency=4))



