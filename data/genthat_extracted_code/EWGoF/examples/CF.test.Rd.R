library(EWGoF)


### Name: CF.test
### Title: GoF tests based on the empirical characteristic function for the
###   Exponential distribution
### Aliases: CF.test
### Keywords: Epps-Pulley Henze-Meintanis Meintanis-Iliopoulos Empirical
###   characteristic function

### ** Examples

x <- rgamma(10,0.3)

#Apply the Epps-Pulley test
CF.test(x,type="EP")

# Apply the test of Meintanis-Iliopoulos
CF.test(x,type="T1",nsim=200)


# Apply the test of Henze-Meintanis
CF.test(x,type="W1",nsim=200)




