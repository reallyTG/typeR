library(DescTools)


### Name: ColToHex
### Title: Convert a Color Into Hex String
### Aliases: ColToHex
### Keywords: color

### ** Examples

ColToHex(c("lightblue", "salmon"))

x <- ColToRgb("darkmagenta")
x[2,] <- x[2,] + 155
RgbToCol(x)



