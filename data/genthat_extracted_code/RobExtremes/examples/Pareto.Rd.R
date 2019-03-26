library(RobExtremes)


### Name: Pareto
### Title: Generating function for Pareto-class
### Aliases: Pareto
### Keywords: distribution

### ** Examples

(P1 <- Pareto(shape = 1, Min = 1))
plot(P1)

E(Pareto()) 
E(P1)
E(P1, function(x){x^2})
var(P1)
sd(P1)
median(P1)
IQR(P1)
mad(P1)




