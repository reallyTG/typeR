library(qdap)


### Name: is.global
### Title: Test If Environment is Global
### Aliases: is.global

### ** Examples

is.global()
lapply(1:3, function(i) is.global())
FUN <- function() is.global(); FUN()

FUN2 <- function(x = is.global(2)) x
FUN2()
FUN3 <- function() FUN2(); FUN3()



