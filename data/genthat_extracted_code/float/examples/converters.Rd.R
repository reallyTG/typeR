library(float)


### Name: converters
### Title: converters
### Aliases: converters fl dbl int as.float as.double.float32
###   as.integer.float32 as.numeric,float32-method as.vector.float32
###   as.matrix.float32 typeof,float32-method storage.mode,float32-method

### ** Examples

library(float)

x = matrix(1:30, 10, 3)
s = fl(x)

y = dbl(s)

all.equal(x, y)




