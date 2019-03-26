library(Rssa)


### Name: parestimate
### Title: Estimate periods from (set of) eigenvectors
### Aliases: parestimate parestimate.1d.ssa parestimate.toeplitz.ssa
###   parestimate.mssa parestimate.cssa parestimate.nd.ssa

### ** Examples

# Decompose 'co2' series with default parameters
s <- ssa(co2, neig = 20)
# Estimate the periods from 2nd and 3rd eigenvectors using 'pairs' method
print(parestimate(s, groups = list(c(2, 3)), method = "pairs"))
# Estimate the peroids from 2nd, 3rd, 5th and 6th eigenvectors using ESPRIT
pe <- parestimate(s, groups = list(c(2, 3, 5, 6)), method = "esprit")
print(pe)
plot(pe)

## No test: 
# Artificial image for 2D SSA
mx <- outer(1:50, 1:50,
            function(i, j) sin(2*pi * i/17) * cos(2*pi * j/7) + exp(i/25 - j/20)) +
      rnorm(50^2, sd = 0.1)
# Decompose 'mx' with default parameters
s <- ssa(mx, kind = "2d-ssa")
# Estimate parameters
pe <- parestimate(s, groups = list(1:5))
print(pe)
plot(pe, col = c("green", "red", "blue"))

# Real example: Mars photo
data(Mars)
# Decompose only Mars image (without background)
s <- ssa(Mars, mask = Mars != 0, wmask = circle(50), kind = "2d-ssa")
# Reconstruct and plot texture pattern
plot(reconstruct(s, groups = list(c(13,14, 17, 18))))
# Estimate pattern parameters
pe <- parestimate(s, groups = list(c(13,14, 17, 18)))
print(pe)
plot(pe, col = c("green", "red", "blue", "black"))
## End(No test)



