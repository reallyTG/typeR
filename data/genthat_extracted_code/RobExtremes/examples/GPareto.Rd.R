library(RobExtremes)


### Name: GPareto
### Title: Generating function for GPareto-class
### Aliases: GPareto
### Keywords: distribution

### ** Examples

(P1 <- GPareto(loc = 1, scale = 1, shape = -0.5))
plot(P1)

E(GPareto()) 
E(P1)
E(P1, function(x){x^2})
var(P1)
sd(P1)
median(P1)
IQR(P1)
mad(P1)




