library(NSM3)


### Name: e.mc
### Title: Function to compute the Monte Carlo P-value for the observed
###   Epstein E statistic
### Aliases: e.mc
### Keywords: Epstein Monte Carlo

### ** Examples

ex11.1<-c(42, 43, 51, 61, 66, 69, 71, 81, 82, 82)
Ep <- e.mc(ex11.1, alt="ifr", exact=TRUE)
Ep$E
Ep$p

#Large Sample Approximation
Ep.lsa <- e.mc(ex11.1, alt="ifr")

table11.2<-c(487, 18, 100, 7, 98, 5, 85, 91, 43, 230, 3, 130)
Ep=e.mc(table11.2,alt="i", exact=TRUE)
#Failing to converge
Ep=e.mc(table11.2,alt="i", exact=TRUE, min.reps=5, max.reps=5)



