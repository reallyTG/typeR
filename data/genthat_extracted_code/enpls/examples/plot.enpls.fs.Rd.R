library(enpls)


### Name: plot.enpls.fs
### Title: Plot enpls.fs object
### Aliases: plot.enpls.fs

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

set.seed(42)
fs = enpls.fs(x, y, reptimes = 50)
plot(fs)
plot(fs, nvar = 10)
plot(fs, type = "boxplot")
plot(fs, type = "boxplot", limits = c(0.05, 0.95))



