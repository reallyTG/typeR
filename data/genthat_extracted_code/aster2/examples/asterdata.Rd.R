library(aster2)


### Name: asterdata
### Title: Object Describing Saturated Aster Model
### Aliases: asterdata validasterdata is.validasterdata
### Keywords: manip

### ** Examples

data(test1)
fred <- asterdata(test1, vars = c("m1", "n1", "n2"), pred = c(0, 1, 1),
    group = c(0, 0, 2), code = c(1, 2, 2),
    families = list("bernoulli", "normal.location.scale"))
is.validasterdata(fred)



