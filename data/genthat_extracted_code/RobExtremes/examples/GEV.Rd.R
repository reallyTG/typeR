library(RobExtremes)


### Name: GEV
### Title: Generating function for GEV-class
### Aliases: GEV
### Keywords: distribution

### ** Examples

(P1 <- GEV(loc = 0, scale = 1, shape = 0))
plot(P1)

E(GEV()) 
E(P1)
E(P1, function(x){x^2})
var(P1)
sd(P1)
median(P1)
IQR(P1)
mad(P1)




