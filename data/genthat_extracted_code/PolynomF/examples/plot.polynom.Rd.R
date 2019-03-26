library(PolynomF)


### Name: plot.polynom
### Title: Graphical display of polynomial objects
### Aliases: plot.polynom plot.polylist lines.polylist lines.polynom
###   points.polylist points.polynom
### Keywords: symbolmath

### ** Examples

x <- polynom()
L <- polylist(1, 1-x)
for(j in 2:10) L[[j+1]] <- (2*j - 1 - x)*L[[j]] - (j-1)^2*L[[j-1]]
plot(L[1:5], xlim = c(0,5), xaxs = "r", ylab = expression(L[j](z)),
xlab = "z", main = "Laguerre polynomials to degree 4")

lines(L[[6]], col = "grey", lwd = 2)



