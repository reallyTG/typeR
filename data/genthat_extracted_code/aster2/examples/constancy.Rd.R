library(aster2)


### Name: constancy
### Title: Constancy Spaces for Aster Models
### Aliases: constancy is.same
### Keywords: misc

### ** Examples

data(test1)
fred <- asterdata(test1,
    vars = c("m1", "m2", "m3", "n1", "n2", "b1", "p1", "z1"),
    pred = c(0, 0, 0, 1, 1, 2, 3, 6), group = c(0, 1, 2, 0, 4, 0, 0, 0),
    code = c(1, 1, 1, 2, 2, 3, 4, 5),
    families = list(fam.multinomial(3), "normal.location.scale",
    "bernoulli", "poisson", "zero.truncated.poisson"))
cmat <- constancy(fred, parm.type = "phi")



