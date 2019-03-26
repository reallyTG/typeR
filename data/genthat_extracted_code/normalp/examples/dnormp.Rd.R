library(normalp)


### Name: dnormp
### Title: Density function of an exponential power distribution
### Aliases: dnormp
### Keywords: distribution

### ** Examples

## Compute the density for a vector x with mu=0, sigmap=1 and p=1.5
## At the end we have the graph of the exponential power distribution 
## density function with p=1.5
x <- c(-1, 1)
f <- dnormp(x, p=1.5)
print(f)
plot(function(x) dnormp(x, p=1.5) , -4, 4,
          main = "Exponential power distribution density function (p=1.5)", ylab="f(x)")



