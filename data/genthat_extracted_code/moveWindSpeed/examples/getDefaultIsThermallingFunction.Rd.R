library(moveWindSpeed)


### Name: getDefaultIsThermallingFunction
### Title: A function to generate an isThermallingFunction
### Aliases: getDefaultIsThermallingFunction

### ** Examples

fun<-getDefaultIsThermallingFunction(170)
fun(1:160)
fun(1:190, rep(2,190))
fun<-getDefaultIsThermallingFunction(170, 3)
fun(1:190, rep(2,190))
fun(1:190, rep(3.4,190))



