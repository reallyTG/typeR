library(plyr)


### Name: here
### Title: Capture current evaluation context.
### Aliases: here

### ** Examples

df <- data.frame(a = rep(c("a","b"), each = 10), b = 1:20)
f1 <- function(label) {
   ddply(df, "a", mutate, label = paste(label, b))
}
## Not run: f1("name:")
# Doesn't work because mutate can't find label in the current scope

f2 <- function(label) {
   ddply(df, "a", here(mutate), label = paste(label, b))
}
f2("name:")
# Works :)



