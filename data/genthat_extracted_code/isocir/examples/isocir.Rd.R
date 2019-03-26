library(isocir)


### Name: isocir
### Title: S3 Objects of Class isocir.
### Aliases: isocir is.isocir print.isocir
### Keywords: isocir

### ** Examples

data(cirdata)
x <- CIRE(cirdata)
print(x)
is.isocir(x)
class(x)

plot(x)
class(x)

# If you want to use the CIRE in other calculations you can obtain it as a vector:
unlist(x$CIRE)
# But be careful because this unclass and lost attributes! 

# To create a new object of class CIRE:
y <- isocir()



