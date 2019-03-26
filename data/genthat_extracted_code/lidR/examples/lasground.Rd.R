library(lidR)


### Name: lasground
### Title: Classify points as 'ground' or 'not ground'
### Aliases: lasground

### ** Examples

LASfile <- system.file("extdata", "Topography.laz", package="lidR")
las <- readLAS(LASfile, select = "xyzrn")

# Using the Progressive Morphological Filter
# --------------------------------------

ws  <- seq(3,12, 3)
th  <- seq(0.1, 1.5, length.out = length(ws))

las <- lasground(las, pmf(ws, th))
plot(las, color = "Classification")

# Using the Cloth Simulation Filter
# --------------------------------------

las <- lasground(las, csf())



