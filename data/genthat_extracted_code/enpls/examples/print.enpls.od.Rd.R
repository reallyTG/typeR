library(enpls)


### Name: print.enpls.od
### Title: Print enpls.od Object
### Aliases: print.enpls.od

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

set.seed(42)
od = enpls.od(x, y, reptimes = 40)
print(od)



