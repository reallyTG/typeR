library(jwutil)


### Name: build_formula
### Title: build simple linear formula from variable names
### Aliases: build_formula buildLinearFormula

### ** Examples

print(f <- build_formula(left = "A", right = c("B", "C")))
class(f)

build_formula(left = "Species", right = names(iris)[1:4])



