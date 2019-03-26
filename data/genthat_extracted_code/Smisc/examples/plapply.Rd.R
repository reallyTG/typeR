library(Smisc)


### Name: plapply
### Title: Simple parallelization of lapply
### Aliases: plapply
### Keywords: misc

### ** Examples

# Create a simple list
a <- list(a = rnorm(10), b = rnorm(20), c = rnorm(15), d = rnorm(13),
          e = rnorm(15), f = rnorm(22))

# Some objects that will be needed by f1:
b1 <- rexp(20)
b2 <- rpois(10, 20)

# The function
f1 <- function(x) mean(x) + max(b1) - min(b2)

# Call plapply
res1 <- plapply(a, f1, njobs = 2, needed.objects = c("b1", "b2"),
                check.interval.sec = 0.5, max.hours = 1/120,
                workDir = "example1", rout = "example1.Rout",
                clean.up = FALSE)

print(res1)

# Look at the collated 'Rout' file
more("example1.Rout")

# Look at the contents of the working directory
dir("example1")

# Remove working directory and Rout file
unlink("example1", recursive = TRUE, force = TRUE)
unlink("example1.Rout")
 
# Verify the result with lapply
res2 <- lapply(a, f1)

# Compare results
identical(res1, res2)



