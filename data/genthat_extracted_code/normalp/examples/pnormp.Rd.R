library(normalp)


### Name: pnormp
### Title: Probability function of an exponential power distribution
### Aliases: pnormp
### Keywords: distribution

### ** Examples

## Compute the distribution function for a vector x with mu=0, sigmap=1 and p=1.5
## At the end we have the graph of the exponential power distribution function with p=1.5.
x <- c(-1, 1)
pr <- pnormp(x, p=1.5)
print(pr)
plot(function(x) pnormp(x, p=1.5), -4, 4,
          main = "Exponential Power Distribution Function (p=1.5)", ylab="F(x)")



