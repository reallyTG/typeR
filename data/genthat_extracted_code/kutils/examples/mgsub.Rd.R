library(kutils)


### Name: mgsub
### Title: apply a vector of replacements, one after the other.
### Aliases: mgsub

### ** Examples

x <- c("Tom", "Jerry", "Elmer", "Bugs")
pattern <- c("Tom", "Bugs")
replacement <- c("Thomas", "Bugs Bunny")
(y <- mgsub(pattern, replacement, x))
x[1] <- "tom"
(y <- mgsub(pattern, replacement, x, ignore.case = TRUE))
(y <- mgsub(c("Elmer", "Bugs"), c("Looney Characters"), x, ignore.case = TRUE))



