library(kzs)


### Name: kzs.md
### Title: Spatial Kolmogorov-Zurbenko Spline
### Aliases: kzs.md
### Keywords: smooth ts nonparametric

### ** Examples

# This example is an extension of the example documented in kzs.2d. We make 
# use of the Sinc function to filter a signal buried in noise over 3-dimensional 
# input variables. See the "Details" section of the "kzs.3d_data" data frame 
# documentation for specific details. 
require(lattice)

# Gridded data for X = (X1, X2) input variables
x1 <- seq(-1.5*pi, 1.5*pi, length = 50)
x2 <- x1	
df <- expand.grid(x1 = x1, x2 = x2)
	
# Time dimension
time <- 1:50

# Change the amplitude of the original function to change from 0 to 1 along time
amplitude <- sort(round(seq(0.02, 1, 0.02), digits = 2))

# Store the time and amplitude together in a data frame
t_amp <- data.frame(cbind(time, amplitude))

# Create the data set of Sinc function outcomes for each amplitude
sinc <- array(0, dim = c(nrow(df), length(amplitude)))
for (i in 1:length(amplitude)) {
	sinc[,i] <- round(amplitude[i]*sin(sqrt(df$x1^2 + df$x2^2)) / 
		    	sqrt(df$x1^2 + df$x2^2)) 
	sinc[,i][is.na(sinc[,i])] <- amplitude[i]
}

# Add noise to distort the signal 
for (j in 1:ncol(sinc)) {
	ez <- rnorm(nrow(sinc), mean = 0, sd = 1)
	sinc[,j] <- sinc[,j] + ez
}

# Change to a data frame and add the gridded input data 
kzs.2d_data <- as.data.frame(cbind(df, sinc)) 

### Movie of the signal buried in noise
grayscale = colorRampPalette(c("white", "gray", "black"))
for (u in 1:50) {
	plot(levelplot(kzs.2d_data[,u+2] ~ x1*x2, kzs.2d_data, 
		col.regions = grayscale, colorkey = FALSE))
}

### Movie of KZS 4-dimensional KZS outcome
data(kzs.3d_data)
bluered = colorRampPalette(c("blue", "cyan2", "green", 
			     "yellow", "red", "firebrick"), space = "rgb")
for (j in 1:50) {
	plot(levelplot(kzs.3d_data[,j+2] ~ x1*x2, kzs.3d_data, 
           at = do.breaks(c(-0.3, 1.0), 100), col.regions = bluered))
} 



