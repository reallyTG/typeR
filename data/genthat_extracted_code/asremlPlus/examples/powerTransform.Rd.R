library(asremlPlus)


### Name: powerTransform
### Title: Performs a combination of a linear and a power transformation on
###   a variable. The transformed variable is stored in the 'data.frame
###   data'.
### Aliases: powerTransform
### Keywords: manip

### ** Examples

## set up a factor with labels
x.dat <- data.frame(y = c(14, 42, 120, 150))
 
## transform y to logarithms
trans <- powerTransform("y", power = 0, titles=list(y = "Length (cm)"), data = x.dat)
x.dat <- trans$data
tvar.name <- trans$tvar.name

## transform y to logarithms after multiplying by -1 and adding 1.
z.dat <- data.frame( y = c(-5.25, -4.29, -1.22, 0.05))
trans <- powerTransform("y", power = 0, scale = -1, offset = 1 ,
                        titles=list(y = "Potential"), data = z.dat)
z.dat <- trans$data
tvar.name <- trans$tvar.name



