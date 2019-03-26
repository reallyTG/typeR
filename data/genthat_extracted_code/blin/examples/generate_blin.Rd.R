library(blin)


### Name: generate_blin
### Title: Generate data from the continuous BLIN model
### Aliases: generate_blin
### Keywords: external

### ** Examples

S <- 5
L <- 4
tmax <- 10
data <- generate_blin(S,L,tmax, lag=2, sparse=.8)
names(data)
dim(data$X)
data$A




