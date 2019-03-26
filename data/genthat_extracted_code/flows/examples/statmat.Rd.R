library(flows)


### Name: statmat
### Title: Descriptive Statistics on Flow Matrix
### Aliases: statmat

### ** Examples

# Import data
data(nav)
myflows <- prepflows(mat = nav, i = "i", j = "j", fij = "fij")

# Get statistics and graphs about the matrix
mystats <- statmat(mat = myflows, output = "all", verbose = TRUE)

# Size of connected components
mystats$sizecomp

# Sum of flows
mystats$sumflows

# Plot Lorenz curve only
statmat(mat = myflows, output = "lorenz", verbose = FALSE)

# Statistics only
mystats <- statmat(mat = myflows, output = "none", verbose = FALSE)
str(mystats)



