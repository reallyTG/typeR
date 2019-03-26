library(forcats)


### Name: fct_c
### Title: Concatenate factors, combining levels
### Aliases: fct_c

### ** Examples

fa <- factor("a")
fb <- factor("b")
fab <- factor(c("a", "b"))

c(fa, fb, fab)
fct_c(fa, fb, fab)

# You can also pass a list of factors with !!!
fs <- list(fa, fb, fab)
fct_c(!!!fs)



