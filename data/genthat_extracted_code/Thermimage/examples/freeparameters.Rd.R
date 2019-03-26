library(Thermimage)


### Name: freeparameters
### Title: Parameters required for free convection equation.
### Aliases: freeparameters

### ** Examples

## The function is currently defined as
function (L = 0.1, Ts = 30, Ta = 20, shape = "hcylinder") 
{
    a = 1
    Gr <- Grashof(L = 1, Ts = Ts, Ta = Ta)
    Pr <- Prandtl(Ta)
    if (shape == "hcylinder") {
        b <- 0.53
        m <- 0.25
    }
    if (shape == "vcylinder") {
        b <- 0.726
        m <- 0.25
    }
    if (shape == "hplate") {
        b <- 0.71
        m <- 0.25
    }
    if (shape == "vplate") {
        b <- 0.523
        m <- 0.25
    }
    if (shape == "sphere") {
        b <- 0.58
        m <- 0.25
    }
    coeffs <- c(a, b, m)
    names(coeffs) <- c("a", "b", "m")
    coeffs
  }

# Example:
L<-0.1
Ts<-30
Ta<-20
shape="hcylinder"
freeparameters(L, Ts, Ta, shape)

shape="vcylinder"
freeparameters(L, Ts, Ta, shape)

shape="hplate"
freeparameters(L, Ts, Ta, shape)

shape="vplate"
freeparameters(L, Ts, Ta, shape)

shape="sphere"
freeparameters(L, Ts, Ta, shape)




