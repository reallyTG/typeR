library(SurvRegCensCov)


### Name: censorContVar
### Title: Censor a vector of continuous numbers
### Aliases: censorContVar
### Keywords: methods

### ** Examples


## random vector
x <- rnorm(200)

## interval-censor this vector at -1 and 0.5
censorContVar(x, -1, 0.5)



