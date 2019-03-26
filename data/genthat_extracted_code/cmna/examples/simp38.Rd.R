library(cmna)


### Name: simp38
### Title: Simpson's 3/8 rule
### Aliases: simp38

### ** Examples

f <- function(x) { sin(x)^2 + log(x) }
simp38(f, 1, 10, m = 10)
simp38(f, 1, 10, m = 100)
simp38(f, 1, 10, m = 1000)




