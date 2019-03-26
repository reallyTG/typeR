library(sadists)


### Name: dneta
### Title: The doubly non-central Eta distribution.
### Aliases: ddneta dneta pdneta qdneta rdneta
### Keywords: distribution

### ** Examples

rv <- rdneta(500, df=100,ncp1=1.5,ncp2=12)
d1 <- ddneta(rv, df=100,ncp1=1.5,ncp2=12)
## Not run: 
##D plot(rv,d1)
## End(Not run)
p1 <- ddneta(rv, df=100,ncp1=1.5,ncp2=12)
# should be nearly uniform:
## Not run: 
##D plot(ecdf(p1))
## End(Not run)
q1 <- qdneta(ppoints(length(rv)), df=100,ncp1=1.5,ncp2=12)
## Not run: 
##D qqplot(x=rv,y=q1)
## End(Not run)



