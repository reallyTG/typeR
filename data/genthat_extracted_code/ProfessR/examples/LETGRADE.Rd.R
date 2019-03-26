library(ProfessR)


### Name: LETGRADE
### Title: Letter Grade
### Aliases: LETGRADE
### Keywords: misc

### ** Examples

g = rnorm(25, m=82, sd=10)
g[g>100] = 100
g[g<1] = 1


L = LETGRADE(g)

cbind(g, L)





