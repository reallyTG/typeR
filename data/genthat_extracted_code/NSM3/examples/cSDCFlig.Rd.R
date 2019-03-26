library(NSM3)


### Name: cSDCFlig
### Title: Computes a critical value for the Dwass, Steel,
###   Critchlow-Fligner W distribution.
### Aliases: cSDCFlig
### Keywords: Dwass Steel Critchlow-Fligner

### ** Examples

##Hollander-Wolfe-Chicken Chapter 6 Comment 55
#cSDCFlig(.0331, c(3, 5, 7),n.mc=10000)
cSDCFlig(.0331, c(3, 5, 7),n.mc=2500)

##Another example
#cSDCFlig(alpha=0.05,n=rep(4,3),method="Exact")
cSDCFlig(alpha=0.05,n=rep(4,3),method="Monte Carlo",n.mc=2500)
#cSDCFlig(alpha=0.05,n=rep(4,3),method="Asymptotic")



