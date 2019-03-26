library(kutils)


### Name: alphaOnly
### Title: Keep only alpha-numeric symbols
### Aliases: alphaOnly

### ** Examples

x <- c("[]kansas(city) Missouri", "percent%slash/",
       "\back{squiggle}_under(paren)", "*star-minus+plus")
alphaOnly(x)
alphaOnly(x, also = c(" " = "_", "+" = "_"))
alphaOnly(x, also = c("(" = "[", ")" = "]"))



