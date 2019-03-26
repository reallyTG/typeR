library(berryFunctions)


### Name: TFtest
### Title: Test logical expressions
### Aliases: TFtest
### Keywords: logic

### ** Examples

TFtest(!a & !b)
TFtest(!a & !b, a&b, !(a&b))
TFtest(!a & !b | c)
TFtest(!a & !b | c, na=FALSE)
TFtest(!a)
TFtest(a&b|c, (a&b)|c, a&(b|c), na=FALSE) # AND has precedence over OR




