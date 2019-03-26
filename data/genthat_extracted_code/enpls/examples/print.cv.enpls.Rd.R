library(enpls)


### Name: print.cv.enpls
### Title: Print cv.enpls Object
### Aliases: print.cv.enpls

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

set.seed(42)
cvfit = cv.enpls(x, y, reptimes = 10)
print(cvfit)



