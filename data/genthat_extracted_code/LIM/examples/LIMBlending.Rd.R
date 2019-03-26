library(LIM)


### Name: LIMBlending
### Title: A blending problem specification
### Aliases: LIMinputBlending LIMBlending
### Keywords: datasets

### ** Examples


# 1. Solve the model with linear programming
res <- Linp(LIMBlending, ispos = TRUE)

# show results
print(c(res$X, Cost = res$solutionNorm))


# 2. Possible ranges of the three ingredients
(xr <- Xranges(LIMBlending, ispos = TRUE))
Nx <- LIMBlending$NUnknowns

# plot
dotchart(x = as.vector(res$X), xlim = range(xr),
         labels = LIMBlending$Unknowns,
         main = "Optimal blending with ranges",
         sub = "using linp and xranges", pch = 16)
segments(xr[ ,1], 1:Nx, xr[ ,2], 1:Nx)
legend  ("topright", pch = c(16, NA), lty = c(NA, 1),
          legend = c("Minimal cost", "range"))

# 3. Random sample of the three ingredients
# The inequality that all x > 0 has to be added!
blend   <- LIMBlending
blend$G <- rbind(blend$G, diag(3))
blend$H <- c(blend$H, rep(0, 3))

xs <- Xsample(blend)

pairs(xs, main = "Blending, 3000 solutions with xsample")



