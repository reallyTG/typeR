library(DescTools)


### Name: HexToCol
### Title: Identify Closest Match to a Color Given by a Hexadecimal String
### Aliases: HexToCol
### Keywords: color

### ** Examples

ColToHex(c("lightblue", "salmon"))

HexToCol(c("#ADD8E6", "#FA1572"))
HexToCol(Pal("Helsana"))

x <- ColToRgb("darkmagenta")
x[2,] <- x[2,] + 155
RgbToCol(x)



