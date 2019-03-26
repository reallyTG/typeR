library(astrochron)


### Name: testPrecession
### Title: Astrochronologic testing via the precession amplitude modulation
###   approach of Zeeden et al. (2015).
### Aliases: testPrecession

### ** Examples

## No test: 
### as a test series, use the three dominant precession terms from Berger et al. (1992)
ex<-cycles(start=0,end=1000,dt=2)

### now conduct astrochronologic testing
res1=testPrecession(ex)


### if you plan to run testPrecession repeatedly, it is advisable to download the astronomical
### solution first
solution<-getLaskar()

### now conduct astrochronologic testing
res2<-testPrecession(ex,solution=solution)
## End(No test)



