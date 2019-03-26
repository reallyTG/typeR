library(yarrr)


### Name: recodev
### Title: recodev
### Aliases: recodev

### ** Examples


x <- c("y", "y", "XSF", "y", "0", "X", "0", "0", "y", "n", "0", "1", "1")
recodev(original.vector = x,
         old.values = c("y", "1", "n", "0"),
         new.values = c(1, 1, 0, 0)
)


x <- c("y", "y", "XSF", "y", "0", "X", "0", "0", "y", "n", "0", "1", "1")
recodev(original.vector = x,
         old.values = c("y", "1", "n", "0"),
         new.values = c(1, 1, 0, 0),
         others = NA
)





