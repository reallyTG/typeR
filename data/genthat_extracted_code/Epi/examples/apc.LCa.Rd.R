library(Epi)


### Name: apc.LCa
### Title: Fit Age-Period-Cohort models and Lee-Carter models with effects
###   modeled by natural splines.
### Aliases: apc.LCa show.apc.LCa
### Keywords: regression models

### ** Examples

library( Epi )

# Danish lung cancer incidence in 5x5x5 Lexis triangles
data( lungDK )
lc <- subset( lungDK, Ax>40 )[,c("Ax","Px","D","Y")]
names( lc )[1:2] <- c("A","P")
head( lc )

al <- apc.LCa( lc, npar=c(9,6,6,6,10), keep.models=TRUE, maxit=500, eps=10e-3 )
show.apc.LCa( al, dev=FALSE )
show.apc.LCa( al, top="AP" )
show.apc.LCa( al, top="APa" )
show.apc.LCa( al, top="ACa" )

# Danish mortality data
## Not run: 
##D data( M.dk )
##D mdk <- subset( M.dk, sex==1 )[,c("A","P","D","Y")]
##D head( mdk )
##D 
##D al <- apc.LCa( mdk, npar=c(15,15,20,6,6), maxit=50, eps=10e-3,
##D                quiet=FALSE, VC=FALSE )
##D show.apc.LCa( al, dev=FALSE )
##D show.apc.LCa( al, dev=TRUE )
##D show.apc.LCa( al, top="AP" )
##D 
##D # Fit a reasonable model to Danish mortality data and plot results
##D mAPa <- LCa.fit( mdk, model="APa", npar=c(15,15,20,6,6), c.ref=1930,
##D                  a.ref=70, quiet=FALSE, maxit=250 )
##D par( mfrow=c(1,3) )
##D plot( mAPa ) 
## End(Not run)



