library(bazar)


### Name: unwhich
### Title: Quasi-inverse of the 'which' function
### Aliases: unwhich

### ** Examples

x1 <- c(TRUE, FALSE, TRUE, TRUE)
x2 <- unwhich(which(x1), length(x1))
identical(x1, x2) # TRUE

w1 <- c(2, 4, 5, 1, 1)
w2 <- which(unwhich(w1, 10))
identical(sort(unique(as.integer(w1))), w2) # TRUE




