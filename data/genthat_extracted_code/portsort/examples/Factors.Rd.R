library(portsort)


### Name: Factors
### Title: Cryptocurrency Returns and Volume Data
### Aliases: Factors
### Keywords: datasets

### ** Examples

# Load data
data(Factors)
# Unlist the data
R.Forward = Factors[[1]]; R.Lag = Factors[[2]]; V.Lag = Factors[[3]]
head(V.Lag[1:5,1:5])



