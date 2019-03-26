library(NSM3)


### Name: cNDWol
### Title: Function to compute a critical value for the Nemenyi,
###   Damico-Wolfe Y distribution.
### Aliases: cNDWol
### Keywords: Nemenyi Damico-Wolfe

### ** Examples

##Hollander-Wolfe-Chicken Example 6.8 Motivational Effect of Knowledge of Performance
cNDWol(.0554, c(6, 6, 6),"Monte Carlo")
cNDWol(.0554, c(6, 6, 6),"Monte Carlo",n.mc=25000)
cNDWol(.0371, c(6, 6, 6),"Monte Carlo")



