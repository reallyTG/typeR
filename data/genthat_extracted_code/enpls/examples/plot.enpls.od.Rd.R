library(enpls)


### Name: plot.enpls.od
### Title: Plot enpls.od object
### Aliases: plot.enpls.od

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

set.seed(42)
od = enpls.od(x, y, reptimes = 50)
plot(od, criterion = "quantile")
plot(od, criterion = "sd")



