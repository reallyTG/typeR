library(essHist)


### Name: Mixed normals
### Title: The mixture of normal distributions
### Aliases: rmixnorm pmixnorm dmixnorm paramExample
### Keywords: datagen distribution

### ** Examples

## Example claw 
type = "claw" # or equivalently "MW10"
#     generate random numbers
n = 500
Y = rmixnorm(n, type = type)
#     compute the density
x = seq(min(Y), max(Y), length.out = n)
f = dmixnorm(x, type = type)
#     compute the distribution
F = pmixnorm(x, type = type)
#     plots
op = par(mfrow = c(1,2))
plot(x, f, type = "l", main = "Claw Density")
points(Y, rep(0,n))
plot(x, F, type = "l", main = "Claw Distribution")
points(Y, rep(0,n))
par(op)



