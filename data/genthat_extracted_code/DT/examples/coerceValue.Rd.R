library(DT)


### Name: coerceValue
### Title: Coerce a character string to the same type as a target value
### Aliases: coerceValue

### ** Examples

library(DT)
coerceValue("100", 1L)
coerceValue("1.23", 3.1416)
coerceValue("2018-02-14", Sys.Date())
coerceValue("2018-02-14T22:18:52Z", Sys.time())
coerceValue("setosa", iris$Species)
coerceValue("setosa2", iris$Species)  # NA
coerceValue("FALSE", TRUE)  # not supported



