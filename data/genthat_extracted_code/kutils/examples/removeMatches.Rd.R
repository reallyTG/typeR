library(kutils)


### Name: removeMatches
### Title: Remove elements if they are in a target vector, possibly
###   replacing with NA
### Aliases: removeMatches

### ** Examples

x <- c("a", "b", "c", "d", "e", "f")
y <- c("e", "a")
removeMatches(x, y)
y <- c("q", "r", "s")
removeMatches(x, y)



