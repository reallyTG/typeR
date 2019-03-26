library(kutils)


### Name: padW0
### Title: Insert 0's in the front of existing digits or characters so that
###   all elements of a vector have the same number of characters.
### Aliases: padW0

### ** Examples

x1 <- c(0001, 0022, 3432, NA)
padW0(x1)
padW0(x1, n = 10)
x2 <- c("1", "22", "3432", NA)
padW0(x2)
## There's been a problem with strings, but this works now.
## It even preserves non-leading spaces. Hope that's what you want.
x3 <- c("1", "22 4", "34323  42", NA)
padW0(x3)
x4 <- c(1.1, 334.52, NA)
padW0(x4)



