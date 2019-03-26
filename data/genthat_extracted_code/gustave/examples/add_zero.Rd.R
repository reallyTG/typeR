library(gustave)


### Name: add_zero
### Title: Expand a matrix or a data.frame with zeros based on rownames
###   matching
### Aliases: add_zero

### ** Examples

# Data generation
set.seed(1)
n <- 10
p <- 2
y <- matrix(1:(n*p), ncol = p, dimnames = list(sample(letters, n)))
y[c(3, 8, 12)] <- NA
rownames <- letters

# Standard use
add_zero(y, rownames)

# Use when rownames in y do not match
# any element in the rownames argument
rownames(y)[1:3] <- toupper(rownames(y)[1:3])
add_zero(y, rownames)
add_zero(y, rownames, remove = FALSE)




