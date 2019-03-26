library(limSolve)


### Name: Blending
### Title: A linear inverse blending problem
### Aliases: Blending
### Keywords: datasets

### ** Examples

# Generate the equality condition (sum of ingredients = 1)
E <- rep(1, 3)
F <- 1

G <- Blending$G
H <- Blending$H

# add positivity requirement
G <- rbind(G, diag(3))
H <- c(H, rep(0, 3))

# 1. Solve the model with linear programming
res <- linp(E = t(E), F = F, G = G, H = H, Cost = Blending$Cost)


# show results
print(c(res$X, Cost = res$solutionNorm))

dotchart(x = as.vector(res$X), labels = colnames(G),
         main = "Optimal blending with ranges",
         sub = "using linp and xranges", pch = 16, 
         xlim = c(0, 1))

# 2. Possible ranges of the three ingredients
(xr <- xranges(E, F, G, H))
segments(xr[,1], 1:ncol(G), xr[,2], 1:ncol(G))
legend ("topright", pch = c(16, NA), lty = c(NA, 1),
        legend = c("Minimal cost", "range"))

# 3. Random sample of the three ingredients
# The inequality that all x > 0 has to be added!
xs <- xsample(E = E, F = F, G = G, H = H)$X

pairs(xs, main = "Blending, 3000 solutions with xsample")

# Cost associated to these random samples
Costs <- as.vector(varsample(xs, EqA = Blending$Cost))
hist(Costs)
legend("topright", c("Optimal solution",
       format(res$solutionNorm, digits = 3)))



