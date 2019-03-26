library(easyCODA)


### Name: CA
### Title: Correspondence analysis
### Aliases: CA
### Keywords: multivariate

### ** Examples

# (weighted) LRA of the RomanCups data set, showing default symmetric map
data(cups)
PLOT.CA(CA(cups))

data(author)
ca(author)
plot(CA(author))      # ca plot function
PLOT.CA(CA(author))   # easyCODA plot function



