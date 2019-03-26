library(fsdaR)


### Name: swissbanknotes
### Title: Swiss banknote data
### Aliases: swissbanknotes
### Keywords: datasets

### ** Examples

data(swissbanknotes)
head(swissbanknotes)
plot(CovMcd(swissbanknotes[, 1:6]), which="pairs", col=swissbanknotes$class)



