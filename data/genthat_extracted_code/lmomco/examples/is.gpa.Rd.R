library(lmomco)


### Name: is.gpa
### Title: Is a Distribution Parameter Object Typed as Generalized Pareto
### Aliases: is.gpa
### Keywords: utility (distribution, type check) Distribution: Generalized
###   Pareto

### ** Examples

para <- pargpa(lmoms(c(123,34,4,654,37,78)))
if(is.gpa(para) == TRUE) {
  Q <- quagpa(0.5,para)
}



