library(NMOF)


### Name: qTable
### Title: Prepare LaTeX Table with Quartile Plots
### Aliases: qTable

### ** Examples

x <- rnorm(100, mean = 0, sd = 2)
y <- rnorm(100, mean = 1, sd = 2)
z <- rnorm(100, mean = 1, sd = 0.5)
X <- cbind(x, y, z)
res <- qTable(X)
print(res)
cat(res)

## Not run: 
##D ## show vignette with examples
##D qt <- vignette("qTableEx", package = "NMOF")
##D print(qt)
##D edit(qt)
##D 
##D 
##D ## create a simple LaTeX file 'test.tex':
##D ## ---
##D ##  \documentclass{article}
##D ##  \begin{document}
##D ##    \input{res.tex}
##D ##  \end{document}
##D ## ---
##D 
##D res <- qTable(X, filename = "res.tex", yoffset = -0.025, unitlength = "5cm",
##D               circlesize = 0.0125, xmin = -10, xmax = 10, dec = 2)
## End(Not run)



