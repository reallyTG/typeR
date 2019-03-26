library(enpls)


### Name: print.enpls.fs
### Title: Print enpls.fs Object
### Aliases: print.enpls.fs

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

set.seed(42)
fs = enpls.fs(x, y, reptimes = 100)
print(fs)
print(fs, nvar = 10L)



