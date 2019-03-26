library(mize)


### Name: make_mize
### Title: Create an Optimizer
### Aliases: make_mize

### ** Examples

# Function to optimize and starting point
rosenbrock_fg <- list(
  fn = function(x) { 100 * (x[2] - x[1] * x[1]) ^ 2 + (1 - x[1]) ^ 2  },
  gr = function(x) { c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
                         200 *        (x[2] - x[1] * x[1])) })
rb0 <- c(-1.2, 1)

# Create an optimizer and initialize it for use with the Rosenbrock function
opt <- make_mize(method = "L-BFGS", par = rb0, fg = rosenbrock_fg)

# Create optimizer without initialization
opt <- make_mize(method = "L-BFGS")

# Need to call mize_init separately:
opt <- mize_init(opt, rb0, rosenbrock_fg)



