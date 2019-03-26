library(R.oo)


### Name: dimension
### Title: Gets the dimension of the object
### Aliases: dimension.default dimension
### Keywords: attribute utilities internal

### ** Examples

  dimension(matrix(1:100, ncol=10))     # 10 10
  dimension(1:14)                       # 14
  dimension(data.frame(a=1:10, b=10:1)) # 10  2
  dimension(print)                      # NULL



