library(sadists)


### Name: dnbeta
### Title: The doubly non-central Beta distribution.
### Aliases: ddnbeta dnbeta pdnbeta qdnbeta rdnbeta
### Keywords: distribution

### ** Examples

rv <- rdnbeta(500, df1=100,df2=500,ncp1=1.5,ncp2=12)
d1 <- ddnbeta(rv, df1=100,df2=500,ncp1=1.5,ncp2=12)
## Not run: 
##D plot(rv,d1)
## End(Not run)
p1 <- ddnbeta(rv, df1=100,df2=500,ncp1=1.5,ncp2=12)
# should be nearly uniform:
## Not run: 
##D plot(ecdf(p1))
## End(Not run)
q1 <- qdnbeta(ppoints(length(rv)), df1=100,df2=500,ncp1=1.5,ncp2=12)
## Not run: 
##D qqplot(x=rv,y=q1)
## End(Not run)



