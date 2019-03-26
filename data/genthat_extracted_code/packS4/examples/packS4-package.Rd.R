library(packS4)


### Name: packS4-package
### Title: Toy example of a S4 package
### Aliases: packS4 packS4-package
### Keywords: package documentation

### ** Examples

### classW is the constructor of ClassW object
www <- classW(u1=3,u2=4,w1="Title")

### plot is a method for ClassW
plot(www)

### There is no constructor for ClassV (which is bad !)
new("ClassV",v1=2,v2=3)



