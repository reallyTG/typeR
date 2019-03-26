library(limSolve)


### Name: varsample
### Title: Samples the probability density function of variables of linear
###   inverse problems.
### Aliases: varsample
### Keywords: algebra array

### ** Examples

# The probability distribution of vertebrate and invertebrate
# food in the diet of Mink
# food items of Mink are (in that order):

# fish mussels crabs shrimp rodents amphipods ducks
# V    I       I     I      V       I         V 
# V= vertebrate, I = invertebrate

# In matrix form:
VarA <- matrix(ncol = 7, byrow = TRUE, data = c(
        0, 1, 1, 1, 0, 1, 0,   # invertebrates  
        1, 0, 0, 0, 1, 0, 1))  # vertebrates

# first sample the Minkdiet problem
E <- rbind(Minkdiet$Prey, rep(1, 7))
F <- c(Minkdiet$Mink, 1)
X <- xsample(E = E, F = F, G = diag(7), H = rep(0, 7), iter = 1000)$X

#then determine Diet Composition in terms of vertebrate and invertebrate food
DC <- varsample(X = X, EqA = VarA)
hist(DC[,1], freq = FALSE, xlab = "fraction",
     main = "invertebrate food in Mink diet", col = "lightblue")



