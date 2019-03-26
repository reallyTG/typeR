library(polychaosbasics)


### Name: polyLeg
### Title: Calculate Legendre Polynomials from a Dataset
### Aliases: polyLeg
### Keywords: regression

### ** Examples

load(system.file("extdata", "FLORSYS1extract.Rda",
   package="polychaosbasics"))
degree <- 4 # polynomial degree
lhs <- FLORSYS1extract[, -ncol(FLORSYS1extract)] # inputs
Y <- FLORSYS1extract[,ncol(FLORSYS1extract)] #  output
pce <- polyLeg(lhs, Y, degree) 
print(pce)



