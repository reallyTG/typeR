library(Smisc)


### Name: parLapplyW
### Title: A wrapper for parLapply
### Aliases: parLapplyW

### ** Examples

# Create a simple list
a <- list(a = rnorm(10), b = rnorm(20), c = rnorm(15))

# Some objects that will be needed by f1:
b1 <- rexp(20)
b2 <- rpois(10, 20)

# The function, which will depend on the Smisc package
f1 <- function(x, someText = "this.stuff") {
 textJunk <- stripExtension(someText)
 result <- mean(x) + max(b1) - min(b2)
 return(list(textJunk, result))
}

# Call parLapplyW(), loading the Smisc package and passing in the "b1" and "b2" objects
res.1 <- parLapplyW(a, f1, someText = "that.stuff", njobs = 2,
                   expr = expression(library(Smisc)),
                   varlist = c("b1", "b2"))

print(res.1)

# Call parLapplyW(), note that we're sending a different value for "b2" into the worker nodes
# via the 'expr' argument
res.2 <- parLapplyW(a, f1, someText = "that.stuff", njobs = 2,
                   expr = expression({library(Smisc); b2 <- rnorm(10)}),
                   varlist = c("b1"))

# These should not be equivalent
identical(res.1, res.2)

# Call lapply
res.3 <- lapply(a, f1, someText = "that.stuff")

# Compare results, these should be equivalent
identical(res.1, res.3)




