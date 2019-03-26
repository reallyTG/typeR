library(lmomco)


### Name: lmomTLgld
### Title: Trimmed L-moments of the Generalized Lambda Distribution
### Aliases: lmomTLgld
### Keywords: L-moment (distribution) Distribution: Generalized Lambda

### ** Examples


## Not run: 
##D lmomgld(vec2par(c(10,10,0.4,1.3), type='gld'))
##D 
##D PARgld <- vec2par(c(15,12,1,.5), type="gld")
##D theoTLmoms(PARgld, leftrim=0, rightrim=0, nmom=6)
##D lmomTLgld(PARgld, leftrim=0, rightrim=0)
##D 
##D theoTLmoms(PARgld, trim=2, nmom=6)
##D lmomTLgld(PARgld, trim=2)
##D 
##D theoTLmoms(PARgld, trim=3, nmom=6)
##D lmomTLgld(PARgld, leftrim=3, rightrim=3)
##D 
##D theoTLmoms(PARgld, leftrim=10, rightrim=2, nmom=6)
##D lmomTLgld(PARgld, leftrim=10, rightrim=2)
## End(Not run)



