library(limSolve)


### Name: E_coli
### Title: An underdetermined linear inverse problem: the Escherichia Coli
###   Core Metabolism Model.
### Aliases: E_coli
### Keywords: datasets

### ** Examples

# 1. parsimonious (simplest) solution
pars <- lsei(E = E_coli$A, F = E_coli$B, G = E_coli$G, H = E_coli$H)$X

# 2. the optimal solution - solved with linear programming
#    some unknowns can be negative

LP <- linp(E = E_coli$A, F = E_coli$B,G = E_coli$G, H = E_coli$H,
           Cost = -E_coli$Maximise, ispos = FALSE)
(Optimal <- LP$X)

# 3.ranges of all unknowns, including the central value and all solutions
xr   <- xranges(E = E_coli$A, F = E_coli$B, G = E_coli$G, H = E_coli$H,
                central = TRUE, full = TRUE)

# the central point is a valid solution:
X <- xr[ ,"central"]
max(abs(E_coli$A%*%X - E_coli$B))
min(E_coli$G%*%X - E_coli$H)

# 4. Sample solution space; the central value is a good starting point
#   for algorithms cda and rda - but these need many iterations
## Not run: 
##D xs <- xsample(E = E_coli$A, F = E_coli$B, G = E_coli$G,H = E_coli$H,
##D               iter = 50000, out = 5000, type = "rda", x0 = X)$X
##D pairs(xs[ ,10:20], pch = ".", cex = 2, main = "sampling, using rda")
## End(Not run)

# using mirror algorithm takes less iterations,
# but an iteration takes more time ; it is better to start in a corner...
# (i.e. no need to use X as starting value)
xs <- xsample(E = E_coli$A, F = E_coli$B, G = E_coli$G, H = E_coli$H,
              iter = 2000, out = 500, jmp = 50, type = "mirror")$X
pairs(xs[ ,10:20], pch = ".", cex = 2, main = "sampling, using mirror")

# Print results:
data.frame(pars = pars, Optimal = Optimal, xr[ ,1:2],
           Mean = colMeans(xs), sd = apply(xs, 2, sd))

# Plot results
par(mfrow = c(1, 2))
nr <- length(Optimal)/2

ii <- 1:nr
dotchart(Optimal[ii], xlim = range(xr), pch = 16)
segments(xr[ii,1], 1:nr, xr[ii,2], 1:nr)

ii <- (nr+1):length(Optimal)
dotchart(Optimal[ii], xlim = range(xr), pch = 16)
segments(xr[ii,1], 1:nr, xr[ii,2], 1:nr)
mtext(side = 3, cex = 1.5, outer = TRUE, line = -1.5,
      "E coli Core Metabolism, optimal solution and ranges")



