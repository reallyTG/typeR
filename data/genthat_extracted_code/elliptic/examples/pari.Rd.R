library(elliptic)


### Name: pari
### Title: Wrappers for PARI functions
### Aliases: pari PARI P.pari gp GP Gp
### Keywords: math

### ** Examples

## Not run: 
##D  #this in a dontrun environment because it requires pari/gp 
##D z  <- seq(from=1,to=3+2i,len=34)
##D p <- c(1,1i)
##D plot(abs(P.pari(z=z,Omega=p) - P(z=z,Omega=p)))
##D plot(zeta(z=z,params=parameters(Omega=p))- P.pari(z=z,Omega=c(p),pari.fun="ellzeta"))
##D 
## End(Not run)



