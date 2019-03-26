library(lagged)


### Name: Lagged1d-class
### Title: Class Lagged1d
### Aliases: Lagged1d-class
### Keywords: classes

### ** Examples

v <- cos(2*pi*(0:10)/10)
new("Lagged1d", data = v) ## ok, but Lagged() is more convenient
x <- Lagged(v)
class(x) # Lagged1d
x
x[0]
x[0:3]



