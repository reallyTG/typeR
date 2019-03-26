library(NSM3)


### Name: cKW
### Title: Computes a critical value for the Kruskal-Wallis H distribution.
### Aliases: cKW
### Keywords: Kruskal-Wallis

### ** Examples

##Hollander-Wolfe-Chicken Example 6.1 Half-Time of Mucociliary Clearance
#cKW(0.0503,c(5,4,5),"Exact")
cKW(0.7147,c(5,4,5),"Asymptotic")
cKW(0.7147,c(5,4,5),"Monte Carlo",n.mc=20000)



