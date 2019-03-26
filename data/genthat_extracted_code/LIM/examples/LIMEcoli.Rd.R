library(LIM)


### Name: LIMEcoli
### Title: The Escherichia Coli Core Metabolism: Reaction network model
###   specificiation
### Aliases: LIMEcoli
### Keywords: datasets

### ** Examples



# 1. parsimonious (simplest) solution
pars <- Ldei(LIMEcoli)

# 2. the ranges of each reaction
xr  <- Xranges(LIMEcoli, central = TRUE, full = TRUE)

# 3. the optimal solution - solved with linear programming
LP  <- Linp(LIMEcoli)
Optimal <- t(LP$X)

# show the results
data.frame(pars = pars$X, Optimal, xr[ ,1:3])

# The central value of linear programming problem is a valid solution
# the central point is a valid solution:
X   <- xr[ ,"central"]
max(abs(LIMEcoli$A%*%X - LIMEcoli$B))
min(LIMEcoli$G%*%X - LIMEcoli$H)

# 4. Sample solution space  - this takes a while - note that iter is not enough
print(system.time(
  xs <- Xsample(LIMEcoli, iter = 200, type = "mirror", test = TRUE)  ))

pairs(xs[ ,1:10], pch = ".", cex = 2)

# Print results:
data.frame(pars = pars$X, Optimal = Optimal, xr[ ,1:2],
           Mean = colMeans(xs), sd = apply(xs,2,sd))

# Plot results
par(mfrow = c(1, 2))
nr <- LIMEcoli$NUnknowns
ii <- 1:(nr/2)
dotchart(Optimal[ii, 1], xlim = range(xr), pch = 16, cex = 0.8)
segments(xr[ii, 1], 1:nr, xr[ii, 2], 1:nr)
ii <- (nr/2+1):nr
dotchart(Optimal[ii, 1], xlim = range(xr), pch = 16, cex = 0.8)
segments(xr[ii, 1], 1:nr, xr[ii, 2], 1:nr)
mtext(side = 3, cex = 1.5, outer = TRUE, line = -1.5,
      "E coli Core Metabolism, optimal solution and ranges")



