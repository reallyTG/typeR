library(ROptEstOld)


### Name: Gumbel
### Title: Generating function for Gumbel-class
### Aliases: Gumbel
### Keywords: distribution

### ** Examples

(G1 <- Gumbel(loc = 1, scale = 2))
plot(G1)
loc(G1)
scale(G1)
loc(G1) <- -1
scale(G1) <- 2
plot(G1)

E(Gumbel()) # Euler's constant
E(G1, function(x){x^2})

## The function is currently defined as
function(loc = 0, scale = 1){ 
  new("Gumbel", loc = loc, scale = scale)
}



