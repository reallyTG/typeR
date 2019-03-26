library(vows)


### Name: semipar4d
### Title: Massively parallel semiparametric regression for 4-dimensional
###   data
### Aliases: semipar4d

### ** Examples


data(test)
d4 = test$d4
x = test$x
semi.obj = semipar4d(d4, ~sf(x), lsp=-5:5, data=data.frame(x = x))
plot(semi.obj, which.vox = 4)



