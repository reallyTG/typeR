library(threejs)


### Name: scatterplot3js
### Title: Interactive 3D Scatterplots
### Aliases: scatterplot3js

### ** Examples

# Example 1 from the scatterplot3d package (cf.)
z <- seq(-10, 10, 0.1)
x <- cos(z)
y <- sin(z)
scatterplot3js(x, y, z, color=rainbow(length(z)))

# Same example with explicit axis labels
scatterplot3js(x, y, z, color=rainbow(length(z)), axisLabels=c("a", "b", "c"))

# Same example showing multiple point styles with pch
scatterplot3js(x, y, z, color=rainbow(length(z)),
               pch=sample(c(".", "o", letters), length(x), replace=TRUE))

# Point cloud example, should run this with WebGL!
N     <- 20000
theta <- runif (N) * 2 * pi
phi   <- runif (N) * 2 * pi
R     <- 1.5
r     <- 1.0
x <- (R + r * cos(theta)) * cos(phi)
y <- (R + r * cos(theta)) * sin(phi)
z <- r * sin(theta)
d <- 6
h <- 6
t <- 2 * runif (N) - 1
w <- t^2 * sqrt(1 - t^2)
x1 <- d * cos(theta) * sin(phi) * w
y1 <- d * sin(theta) * sin(phi) * w
i <- order(phi)
j <- order(t)
col <- c( rainbow(length(phi))[order(i)],
         rainbow(length(t), start=0, end=2/6)[order(j)])
M <- cbind(x=c(x, x1), y=c(y, y1), z=c(z, h*t))
scatterplot3js(M, size=0.5, color=col, bg="black", pch=".")

# Plot generic text using 'pch' (we label some points in this example)
set.seed(1)
x <- rnorm(5); y <- rnorm(5); z <- rnorm(5)
scatterplot3js(x, y, z, pch="@") %>%
   points3d(x + 0.1, y + 0.1, z, color="red", pch=paste("point", 1:5))

## Not run: 
##D   # A shiny example
##D   shiny::runApp(system.file("examples/scatterplot", package="threejs"))
## End(Not run)

## Not run: 
##D   # A crosstalk example
##D   library(crosstalk)
##D   library(d3scatter) # devtools::install_github("jcheng5/d3scatter")
##D   z <- seq(-10, 10, 0.1)
##D   x <- cos(z)
##D   y <- sin(z)
##D   sd <- SharedData$new(data.frame(x=x, y=y, z=z))
##D   print(bscols(
##D     scatterplot3js(x, y, z, color=rainbow(length(z)), brush=TRUE, crosstalk=sd),
##D     d3scatter(sd, ~x, ~y, width="100%", height=300)
##D   ))
## End(Not run)




