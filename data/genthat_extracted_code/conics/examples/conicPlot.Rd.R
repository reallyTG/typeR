library(conics)


### Name: conicPlot
### Title: Plot a conic
### Aliases: conicPlot
### Keywords: conics,plot

### ** Examples

# Ellipse
# -------
# Equation: 2*x_1^2 + 2*x_1*x_2 + 2*x_2^2 - 20*x_1 - 28*x_2 + 10 = 0
v <- c(2,2,2,-20,-28,10)
conicPlot(v)
v[6] <- 20
conicPlot(v, type='p', col="red", add=TRUE)

# Symmetric matrix
m <- rbind( c(5, -3, -21),
            c(-3, 5, -19),
            c(-21, -19, 93) )
conicPlot(m)

# Hyperbola
# ---------
# Equation: 2*x_1^2 + 2*x_1*x_2 - 2*x_2^2 - 20*x_1 + 20*x_2 + 10 = 0
v <- c(2,2,-2,-20,20,10)
conicPlot(v, center=TRUE, sym.axes=TRUE, asp=1)
conicPlot(v, asymptote=TRUE, as.col="grey30", as.lty=2,
          sym.axes=TRUE, ax.col="red", ax.lty=6, col="blue", asp=1)

# Parabola
# --------
# Equation: 4*x_1^2 + 4*x_1*x_2 + 1*x_2^2 + 20*x_1 + 20*x_2 + 20 = 0
v <- c(4,4,1,20,20,20)
conicPlot(v, sym.axes=TRUE, ax.lty=2, asp=1)

# Degenerate conics
# -----------------
# Intersecting lines
# Equation:  x_1^2 - 2*x_1*x_2 - 8*x_2^2 - 2*x_1 + 14*x_2 - 3 = 0
v <- c(1,-2,-8,-2,14,-3)
conicPlot(v)
# Parallel lines
# Equation: x_1^2 - 2*x_1*x_2 + x_2^2 + 4*x_1 - 4*x_2 + 3 = 0
v <- c(1,-2,1,4,-4,3)
conicPlot(v)
# Coincident lines
# Equation: 4*x_1^2 + 12*x_1*x_2 + 9*x_2^2 - 4*x_1 - 6*x_2 + 1 = 0
v <- c(4,12,9,-4,-6,1)
conicPlot(v)

# Return value
# ------------
v <- c(2,2,2,-20,-28,10)
cp <- conicPlot(v)
cp$kind
cp$vertices
cp$center
cp$axes
cp <- conicPlot(v,type='n')
cp$points



