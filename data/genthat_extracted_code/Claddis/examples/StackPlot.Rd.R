library(Claddis)


### Name: StackPlot
### Title: Plot Stacked Ordination Spaces
### Aliases: StackPlot
### Keywords: coordinates principal

### ** Examples


# Create x-values that will form a grid:
x <- c(c(seq(0, 100, length.out = 101), seq(0, 100, length.out = 101),
  seq(0, 100, length.out = 101), seq(0, 100, length.out = 101)),
  c(rep(20, 101), rep(40, 101), rep(60, 101), rep(80, 101)))

# Create y-values that will form grid:
y <- c(c(rep(20, 101), rep(40, 101), rep(60, 101), rep(80, 101)),
  c(seq(0, 100, length.out = 101), seq(0, 100, length.out = 101),
  seq(0, 100, length.out = 101), seq(0, 100, length.out = 101)))

# Combine x and y values into
ordination_axes <- matrix(c(x, y), ncol = 2, dimnames =
  list(as.list(apply(matrix(sample(LETTERS, 8 * 8 * 101,
  replace = TRUE), nrow = 8 * 101), 1, paste, collapse = "")), NULL))

# Assign ages as though taxa range through entire interval (100-0 Ma):
ages <- matrix(c(rep(100, 8 * 101), rep(0, 8 * 101)), ncol = 2,
  dimnames = list(as.list(rownames(ordination_axes)), as.list(c("FAD",
  "LAD"))))

# Create five 20 million year time slices:
time_slices <- seq(0, 100, length.out = 6)

# Plot grid lines to show "shearing" effect is working:
StackPlot(ordination_axes = ordination_axes, ages = ages, time_slices = time_slices)

# Set random seed:
set.seed(17)

# Create random values to represent ordination axes:
ordination_axes <- matrix(rnorm(10000), nrow = 100, dimnames =
  list(as.list(apply(matrix(sample(LETTERS, 8 * 100, replace = TRUE), nrow = 100),
  1, paste, collapse = "")), NULL))

# Create random first and last appearance dates for objects:
ages <- matrix(as.vector(apply(matrix(runif(200, 0, 100), ncol = 2), 1, sort,
  decreasing = TRUE)), ncol = 2, byrow=TRUE, dimnames =
  list(as.list(rownames(ordination_axes)), as.list(c("FAD", "LAD"))))

# Create five 20 million year long time slices:
time_slices <- seq(0, 100, length.out = 6)

# Define groups for objects at random ("red" and "blue"):
groups <- sample(x = c("red", "blue"), size = nrow(ordination_axes), replace = TRUE)

# Randomly assign objects to groups:
names(groups) <- rownames(ordination_axes)

# Make stacked ordination plot with convex hulls for groups:
StackPlot(ordination_axes, ages, groups, time_slices)




