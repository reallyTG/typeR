library(Smisc)


### Name: dfplapply
### Title: Parallelized single row processing of a data frame
### Aliases: dfplapply
### Keywords: misc

### ** Examples

X <- data.frame(a = 1:3, b = letters[1:3])

## No test: 
# Function that will operate on each of x, producing a simple list
test.1 <- function(x) {
  list(ab = paste(x$a, x$b, sep = "-"), a2 = x$a^2, bnew = paste(x$b, "new", sep = "."))
}

# Data frame output
dfplapply(X, test.1, output.df = TRUE, njobs = 2)

# List output
dfplapply(X, test.1, njobs = 2)

# Function with 2 rows of output
test.2 <- function(x) {
  data.frame(ab = rep(paste(x$a, x$b, sep = "-"), 2), a2 = rep(x$a^2, 2))
}

dfplapply(X, test.2, output.df = TRUE, njobs = 2, verbose = TRUE)
## End(No test)

# Passing in other objects needed by FUN
a.out <- 10
test.3 <- function(x) {
  data.frame(a = x$a + a.out, b = paste(x$b, a.out, sep="-"))
}

dfplapply(X, test.3, output.df = TRUE, needed.objects = "a.out", njobs = 2)



