library(deducorrect)


### Name: deductiveZeros
### Title: Find out which variables can deductively be imputed with 0
### Aliases: deductiveZeros deductiveZeros.editmatrix deductiveZeros.matrix

### ** Examples


# a simple example"
E <- editmatrix(c(
    "x1 + x2 + x3 == xt",
    "x1 >= 0", "x2>=0","x3>=0", "xt>=0"))
x <- c(x1=10,x2=NA,x3=5,xt=15)

# with deductiveZeros we get:
( I <- deductiveZeros(E,x) )
x[I] <- 0

any(violatedEdits(E,x))

# This example is taken from De Waal et al (2011) (Examples 9.1-9.2)
E <- editmatrix(c(
    "x1 + x2      == x3",
    "x2           == x4",
    "x5 + x6 + x7 == x8",
    "x3 + x8      == x9",
    "x9 - x10     == x11",
    "x6 >= 0",
    "x7 >= 0"
))

x <- c(
  x1 = 145, 
  x2 = NA, 
  x3 = 155, 
  x4 = NA, 
  x5 = 86, 
  x6 = NA, 
  x7 = NA, 
  x8 = 86, 
  x9 = NA, 
  x10 = 217, 
  x11 = NA)

# determine zeros:
I <- deductiveZeros(E,x)
# impute:
x[I] <- 0






