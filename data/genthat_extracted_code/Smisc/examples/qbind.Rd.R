library(Smisc)


### Name: qbind
### Title: Quickly row and column bind many objects together at once
### Aliases: qbind

### ** Examples

# Row binding
a1 <- data.frame(a = 1:3, b = rnorm(3), c = runif(3))
a2 <- data.frame(a = 4:6, b = rnorm(3), c = runif(3))
a3 <- data.frame(a = 7:9, b = rnorm(3), c = runif(3))

qbind(paste("a", 1:3, sep = ""))

# Column binding
b1 <- matrix(1:9, nrow = 3, dimnames = list(1:3, letters[1:3]))
b2 <- matrix(10:18, nrow = 3, dimnames = list(4:6, letters[4:6]))
b3 <- matrix(19:27, nrow = 3, dimnames = list(7:9, letters[7:9]))

qbind(paste("b", 1:3, sep = ""), type = "col")

# Concatenating a vector
a1 <- c(x = 1, y = 2)
a2 <- c(z = 3, w = 4)

qbind(c("a1", "a2"), type = "c")



