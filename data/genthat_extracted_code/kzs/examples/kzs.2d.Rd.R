library(kzs)


### Name: kzs.2d
### Title: Spatial Kolmogorov-Zurbenko Spline
### Aliases: kzs.2d
### Keywords: smooth ts nonparametric

### ** Examples

# EXAMPLE - Estimating the Sinc function in the interval (-3pi, 3pi)
#           Load the LATTICE package 


# Gridded data for X = (x1, x2) input variables
x1 <- seq(-3*pi, 3*pi, length = 60)
x2 <- x1			
df <- expand.grid(x1 = x1, x2 = x2)
  
# Apply the Sinc function to the (x1, x2) coordinates
df$z <- sin(sqrt(df$x1^2 + df$x2^2)) / sqrt(df$x1^2 + df$x2^2)
df$z[is.na(df$z)] <- 1

# Any point outside the circle of radius 3pi is set to 0. This provides
# a better picture of the outcome solely for the purposes of this example.
dst <- sqrt((df$x1 - 0)^2 + (df$x2 - 0)^2)
df$dist <- dst	
df$z[df$dist > 3*pi] <- 0

# Add noise to distort the signal
ez <- rnorm(length(df$z), mean = 0, sd = 1) * 1/4    
df$zn <- ez + df$z

### (1) 3D plot of the signal to be estimated by kzs.2d()
wireframe(z ~ x1 * x2, df, main = "Signal to be estimated", drape = TRUE, 
colorkey = TRUE, scales = list(arrows = FALSE))

### (2) 3D plot of the signal buried in noise
wireframe(zn ~ x1 * x2, df, main = "Signal buried in noise", drape = TRUE, 
colorkey = TRUE, scales = list(arrows = FALSE))
  
### (3) Execute kzs.2d()   
# kzs.2d() may take time to run; k = 1 iteration is used here, but k = 2
# will provide a smoother outcome.
sw <- c(1, 1)
sc <- c(0.2, 0.2)
kzs.2d(y = df[,5], x = df[,1:2], smooth = sw, scale = sc, k = 1, edges = TRUE, 
plot = TRUE)  



