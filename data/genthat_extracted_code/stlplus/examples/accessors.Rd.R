library(stlplus)


### Name: seasonal
### Title: Accessor functions for elements of an stl and stlplus object
### Aliases: fc fitted.stl fitted.stlplus getraw predict.stl
###   predict.stlplus remainder remainder.stl remainder.stlplus seasonal
###   seasonal.stl seasonal.stlplus time.stl time.stlplus trend trend.stl
###   trend.stlplus

### ** Examples

co2.stl <- stlplus(co2, t = as.vector(stats::time(co2)), n.p=12, l.window=13,
t.window=19, s.window=35, s.degree=1, sub.labels = substr(month.name, 1, 3))

plot(seasonal(co2.stl))



