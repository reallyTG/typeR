library(Rssa)


### Name: wnorm
### Title: Calculate Weighted Norm of series
### Aliases: wnorm wnorm.1d.ssa wnorm.nd.ssa wnorm.toeplitz.ssa wnorm.mssa
###   wnorm.default wnorm.complex

### ** Examples

wnorm(co2, 20)
# Construct ssa-object for 'co2' with default parameters but don't decompose
ss <- ssa(co2, force.decompose = FALSE)
wnorm(ss)

# Artificial image for 2D SSA
## No test: 
mx <- outer(1:50, 1:50,
            function(i, j) sin(2*pi * i/17) * cos(2*pi * j/7) + exp(i/25 - j/20)) +
      rnorm(50^2, sd = 0.1)
# Construct ssa-object for 'mx' with default parameters but don't decompose
s <- ssa(mx, kind = "2d-ssa", force.decompose = FALSE)
wnorm(s)
## End(No test)



