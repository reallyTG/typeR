library(limSolve)


### Name: RigaWeb
### Title: An underdetermined linear inverse problem: the Gulf of Riga
###   *spring* planktonic food web
### Aliases: RigaWeb
### Keywords: datasets

### ** Examples


E <- RigaWeb$A
F <- RigaWeb$B
G <- RigaWeb$G
H <- RigaWeb$H

# 1. parsimonious (simplest) solution
pars <- lsei(E = E, F = F, G = G, H = H)$X

# 2.ranges of all unknowns, including the central value
xr   <- xranges(E = E, F = F, G = G, H = H, central = TRUE)

# the central point is a valid solution:
X <- xr[,"central"]
max(abs(E%*%X - F))
min(G%*%X - H)

## Not run: 
##D    # this does not work on windows i386!
##D # 3. Sample solution space; the central value is a good starting point
##D #   for algorithms cda and rda - but these need many iterations   
##D xs  <- xsample(E = E, F = F, G = G, H = H,
##D                iter = 10000, out = 1000, type = "rda", x0 = X)$X
##D # better convergence using 50000 iterations, but this takes a while
##D xs  <- xsample(E = E, F = F, G = G, H = H,
##D                iter = 50000, out = 1000, type = "rda", x0 = X)$X
##D 
##D pairs(xs, pch = ".", cex = 2, gap = 0, upper.panel = NULL)
##D 
##D 
##D # using mirror algorithm takes less iterations,
##D # but an iteration takes more time ; it is better to start in a corner...
##D # (i.e. no need to use X as starting value)
##D xs  <- xsample(E = E, F = F, G = G, H = H,
##D                iter = 1500, output = 500, type = "mirror")$X
##D pairs(xs, pch = ".", cex = 2, gap = 0, upper.panel = NULL, 
##D       yaxt = "n", xaxt = "n")
##D 
##D # Print results:
##D data.frame(pars = pars, xr[ ,1:2], Mean = colMeans(xs), sd = apply(xs, 2, sd))
## End(Not run)



