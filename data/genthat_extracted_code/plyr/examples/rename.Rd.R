library(plyr)


### Name: rename
### Title: Modify names by name, not position.
### Aliases: rename

### ** Examples

x <- c("a" = 1, "b" = 2, d = 3, 4)
# Rename column d to "c", updating the variable "x" with the result
x <- rename(x, replace = c("d" = "c"))
x
# Rename column "disp" to "displacement"
rename(mtcars, c("disp" = "displacement"))



