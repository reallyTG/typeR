library(enpls)


### Name: enpls.fs
### Title: Ensemble Partial Least Squares for Measuring Feature Importance
### Aliases: enpls.fs

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

set.seed(42)
fs = enpls.fs(x, y, reptimes = 50)
print(fs)
plot(fs)



