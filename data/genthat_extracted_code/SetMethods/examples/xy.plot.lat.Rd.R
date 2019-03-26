library(SetMethods)


### Name: xy.plot.lat
### Title: Function producing enhanced XY plots with Lattice
### Aliases: xy.plot.lat

### ** Examples

# Generate fake data to have perfect necessity
set.seed(123)
x <- runif(60, 0, 1)
y <- runif(60, 0, 1)

for(i in 1:length(y)) {
    while(x[i] < y[i]) {
        y[i] <- runif(1, 0, 1)
        x[i] <- runif(1, 0, 1)
    }
}

# Default with blue dots and pch = 1
xy.plot.lat(x, y, pch = 1, col = "blue")

# Parameters of fit in the corners with blue dots and pch = 1
xy.plot.lat(x, y, pch = 1, col = "blue", pos.fit = "corner")

# Load the Schneider data:

data(SCHF)

# Plot of condition EMP as necessary for outcome EXPORT with case labels 
# and names for the plot and axes:

xy.plot.lat(SCHF$EMP, SCHF$EXPORT, necessity = TRUE, case.lab = TRUE, 
            labs = rownames(SCHF), main = "EMP as necessary for EXPORT", 
            ylab = "EXPORT", xlab = "EMP")



