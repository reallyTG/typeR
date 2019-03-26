library(secrdesign)


### Name: optimalSpacing
### Title: Optimal Detector Spacing
### Aliases: optimalSpacing
### Keywords: design

### ** Examples


grid <- make.grid(7, 7)  # default multi-catch detector
optimalSpacing(D = 5, traps = grid, detectpar = list(lambda0 = 0.2, sigma = 20), 
   noccasions = 5, plt = TRUE)

## Not run: 
##D 
##D optimalSpacing(D = 5, traps = grid, detectpar = list(lambda0 = 0.4, sigma = 20), 
##D     detectfn = 'HEX', R = seq(1,6,0.4), noccasions = 10, plt = TRUE, col = "blue")
##D 
##D ## with simulations
##D grid <- make.grid(8, 8, spacing = 20, detector = 'proximity')
##D optimalSpacing(D = 5, traps = grid, detectfn = "HHN", detectpar = 
##D     list(lambda0 = 0.2, sigma = 20), noccasions = 5, nrepl = 20, nx = 32, 
##D     ncores = 4, plt = TRUE, col = "blue")
##D 
##D ## manual check
##D grid <- make.grid(8, 8, spacing = 60, detector = 'proximity')
##D scen <- make.scenarios(sigma = 20, D = 5, detectfn = 14, lambda0 = 0.2, sigma = 20,
##D     noccasions = 5)
##D sim1 <- run.scenarios(nrepl = 20, scen, trapset = list(grid), fit = TRUE, 
##D     fit.args = list(detectfn = 14), ncores = 4, byscenario = FALSE)
##D summary(sim1)
##D 
## End(Not run)




