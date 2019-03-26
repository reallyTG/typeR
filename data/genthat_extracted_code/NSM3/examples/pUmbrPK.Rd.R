library(NSM3)


### Name: pUmbrPK
### Title: Function to compute the P-value for the observed Mack-Wolfe Peak
###   Known A_p distribution.
### Aliases: pUmbrPK
### Keywords: Mack-Wolfe Peak Known

### ** Examples

##Hollander-Wolfe-Chicken Example 6.3 Fasting Metabolic Rate of White-Tailed Deer
x<-c(36,33.6,26.9,35.8,30.1,31.2,35.3,39.9,29.1,43.4,44.6,54.4,48.2,55.7,50,53.8,53.9,62.5,46.6,
44.3,34.1,35.7,35.6,31.7,22.1,30.7)
g<-c(rep(1,7),rep(2,3),rep(3,5),rep(4,4),rep(5,4),rep(6,3))

pUmbrPK(x,4,g,"Exact")
pUmbrPK(x,4,g,"Asymptotic")



