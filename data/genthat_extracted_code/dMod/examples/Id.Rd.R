library(dMod)


### Name: Id
### Title: An identity function which vanishes upon concatenation of fns
### Aliases: Id

### ** Examples

x <- Xt()
id <- Id()

(id*x)(1:10, pars = c(a = 1))
(x*id)(1:10, pars = c(a = 1))
str(id*x)
str(x*id)



