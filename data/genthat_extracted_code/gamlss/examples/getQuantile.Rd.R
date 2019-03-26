library(gamlss)


### Name: getQuantile
### Title: Getting the partial quantile function for a term
### Aliases: getQuantile
### Keywords: Statistical Models regression

### ** Examples

library(gamlss)
data(rent)
m1 <- gamlss(R~pb(Fl)+pb(A)+B+loc, data=rent, family=GA)
FF<-getQuantile(m1, quantile=0.9, term="A", plot=TRUE)
FF(1960)
FF(1060, deriv=1)
FF(1060, deriv=2)
## Not run: 
##D # plotting partial quantile
##D # .05, 0.25, 0.5, 0.75, 0.95
##D # at the default values
##D # Fl = median(Fl), B=0, and loc=2
##D plot(R~A, data=rent,  col="lightgray", pch=20)
##D for (i in c(.05, 0.25, 0.5, 0.75, 0.95))
##D {
##D   Qua <- getQuantile(m1, quantile=i,term="A")
##D   curve(Qua, 1900, 1985,  lwd=1, lty=1, add=T)
##D }
##D # plotting at values Fl=60, B=1, and loc=1.
##D for (i in c(.05, 0.25, 0.5, 0.75, 0.95))
##D {
##D   Qua <- getQuantile(m1, quantile=i,term="A", 
##D             fixed.at=list(Fl=60, B=1, loc=1))
##D   curve(Qua, 1900, 1985,  lwd=1, lty=2, col="red", add=T)
##D }
##D # plotting at Fl=60, B=1 and loc=1.
##D for (i in c(.05, 0.25, 0.5, 0.75, 0.95))
##D {
##D   Qua <- getQuantile(m1, quantile=i,term="A", 
##D            fixed.at=list(Fl=120, B=0, loc=3))
##D   curve(Qua, 1900, 1985,  lwd=1, lty=3, col="blue", add=T)
##D }
##D 
## End(Not run)



