library(lidR)


### Name: VCI
### Title: Vertical Complexity Index
### Aliases: VCI

### ** Examples

z = runif(10000, 0, 10)

VCI(z, by = 1, zmax = 20)

z = abs(rnorm(10000, 10, 1))

# expected to be closer to 0.
VCI(z, by = 1, zmax = 20)



