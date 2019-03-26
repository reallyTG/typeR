library(ROCit)


### Name: convertclass
### Title: Converts Binary Vector into 1 and 0
### Aliases: convertclass

### ** Examples

x <- c("cat", "cat", "dog", "cat")
convertclass(x) # by default, "cat" is converted to 0
convertclass(x, reference = "dog")

# ----------------------------

set.seed(10)
x <- round(runif(10, 2, 3))
convertclass(x, reference = 3)
# numeric reference can be supplied as character
convertclass(x, reference = "3") # same result





