library(expss)


### Name: qc
### Title: Create vector of characters from unquoted strings (variable
###   names)
### Aliases: qc subst

### ** Examples


## qc
qc(a, b, c)
identical(qc(a, b, c), c("a", "b", "c"))

mtcars[, qc(am, mpg, gear)]

## subst
i = 1:5
subst("q`i`")

i = 1:3
j = 1:3
subst("q1_`i`_`j`")

data(iris)
subst("'iris' has `nrow(iris)` rows.")



