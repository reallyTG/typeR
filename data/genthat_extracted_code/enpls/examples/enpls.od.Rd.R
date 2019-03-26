library(enpls)


### Name: enpls.od
### Title: Ensemble Partial Least Squares for Outlier Detection
### Aliases: enpls.od

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

set.seed(42)
od = enpls.od(x, y, reptimes = 50)
print(od)
plot(od)
plot(od, criterion = 'sd')



