library(fBasics)


### Name: krigeInterp
### Title: Bivariate Krige Interpolation
### Aliases: krigeInterp
### Keywords: programming

### ** Examples
## No test: 
## The akima library is not auto-installed because of a different licence.
## krigeInterp -  Kriging:
set.seed(1953)
x = runif(999) - 0.5
y = runif(999) - 0.5
z = cos(2*pi*(x^2+y^2))
ans = krigeInterp(x, y, z, extrap = FALSE)
persp(ans, theta = -40, phi = 30, col = "steelblue",
    xlab = "x", ylab = "y", zlab = "z")
contour(ans)
## End(No test)



