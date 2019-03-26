library(GMDH)


### Name: cancer
### Title: Cancer Data
### Aliases: cancer
### Keywords: datasets

### ** Examples

data(cancer)
plot(cancer)
out = fcast(cancer, f.number = 2)
out$mean



