library(lmomco)


### Name: theoTLmoms
### Title: The Theoretical Trimmed L-moments and TL-moment Ratios using
###   Integration of the Quantile Function
### Aliases: theoTLmoms
### Keywords: L-moment (theoretical) L-moment (trimmed theoretical)

### ** Examples

para <- vec2par(c(0,1),type='nor') # standard normal
TL00 <- theoTLmoms(para) # compute ordinary L-moments
TL30 <- theoTLmoms(para,leftrim=3,rightrim=0) # trim 3 smallest samples

# Lets look at the difference from simulation to theoretrical using
# L-kurtosis and asymmetrical trimming for generalized Lambda dist.
P <- vec2par(c(10000,10000,6,.4),type='gld')
Lkurt <- TLmoms(quagld(runif(100),P),rightrim=3,leftrim=0)$ratios[4]
theoLkurt <- theoTLmoms(P,rightrim=3,leftrim=0)$ratios[4]
Lkurt - theoLkurt # as the number for runif goes up, this
                  # difference goes to zero

# Example using the Generalized Pareto Distribution
# to verify computations from theoretical and sample stand point.
n      <- 100 # really a much larger sample should be used---for speed
P      <- vec2par(c(12,34,4),type='gpa')
theoTL <- theoTLmoms(P,rightrim=2,leftrim=4)
samTL  <- TLmoms(quagpa(runif(n),P),rightrim=2,leftrim=4)
del    <- samTL$ratios[3] - theoTL$ratios[3] # if n is large difference
                                             # is small
str(del)

## Not run: 
##D "cusquaf" <- function(f, para, ...) { # Gumbel-Normal product
##D    g <- vec2par(c(para[1:2]), type="gum")
##D    n <- vec2par(c(para[3:4]), type="nor")
##D    return(par2qua(f,g)*par2qua(f,n))
##D }
##D para <- c(5.6, .45, 3, .3)
##D theoTLmoms(para, quafunc=cusquaf) # L-skew = 0.13038711
## End(Not run)



