library(fCopulae)


### Name: EllipticalDependency
### Title: Bivariate Elliptical Copulae
### Aliases: EllipticalDependency ellipticalTau ellipticalRho
###   ellipticalTailCoeff ellipticalTailPlot
### Keywords: models

### ** Examples

## [rp]ellipticalCopula -
   # Default Normal Copula:
   rellipticalCopula(10)
   pellipticalCopula(10)

## [rp]ellipticalCopula -   
   # Student-t Copula Probability and Density:
   u = grid2d(x = (0:25)/25)
   pellipticalCopula(u, rho = 0.75, param = 4, 
     type = "t", output = "list")
   d <- dellipticalCopula(u, rho = 0.75, param = 4, 
     type = "t", output = "list")   
   persp(d, theta = -40, phi = 30, col = "steelblue")
   
## ellipticalTau -
## ellipticalRho -
   # Dependence Measures:
   ellipticalTau(rho = -0.5)
   ellipticalRho(rho = 0.75, type = "logistic", subdivisions = 100)
   
## ellipticalTailCoeff -
   # Student-t Tail Coefficient:
   ellipticalTailCoeff(rho = 0.25, param = 3, type = "t")

## gfunc -
   # Generator Function:
   plot(gfunc(x = 0:10), main = "Generator Function")
   
## ellipticalCopulaSim -
## ellipticalCopulaSim -
   # Simualtion and Parameter Fitting:
   rv <- ellipticalCopulaSim(n = 100, rho = 0.75)
   ellipticalCopulaFit(rv)



