library(BMisc)


### Name: rhs.vars
### Title: rhs.vars
### Aliases: rhs.vars

### ** Examples

ff <- yvar ~ x1 + x2
rhs.vars(ff)

ff <- y ~ x1 + I(x1^2)
rhs.vars(ff)




