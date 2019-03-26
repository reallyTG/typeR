library(Smisc)


### Name: padZero
### Title: Pad a vector of numbers with zeros
### Aliases: padZero
### Keywords: misc

### ** Examples

# Examples with 0's on the left
padZero(c(1, 10, 100))
padZero(c(1, 10, 100), num = 4)

# Examples with 0's on the right
padZero(c(1.2, 1.34, 1.399), side = "r")
padZero(c(1.2, 1.34, 1.399), num = 5, side = "r")



