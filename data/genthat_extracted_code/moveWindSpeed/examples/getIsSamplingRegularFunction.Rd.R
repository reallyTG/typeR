library(moveWindSpeed)


### Name: getIsSamplingRegularFunction
### Title: A function to generate functions used to check if a segment is
###   regular
### Aliases: getIsSamplingRegularFunction

### ** Examples

fun<-getIsSamplingRegularFunction(10)
fun(Sys.time()+1:5)
fun(Sys.time()+c(0,10,20,30))
fun(Sys.time()+c(0,10,20,31))



