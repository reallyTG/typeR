library(lmomco)


### Name: lmomTLgpa
### Title: Trimmed L-moments of the Generalized Pareto Distribution
### Aliases: lmomTLgpa
### Keywords: L-moment (distribution) Distribution: Generalized Pareto

### ** Examples

TL <- TLmoms(c(123,34,4,654,37,78,21,3400),trim=1)
TL
lmomTLgpa(parTLgpa(TL))



