library(sadists)


### Name: dnf
### Title: The doubly non-central F distribution.
### Aliases: ddnf dnf pdnf qdnf rdnf
### Keywords: distribution

### ** Examples

rv <- rdnf(500, df1=100,df2=500,ncp1=1.5,ncp2=12)
d1 <- ddnf(rv, df1=100,df2=500,ncp1=1.5,ncp2=12)
## Not run: 
##D plot(rv,d1)
## End(Not run)
p1 <- ddnf(rv, df1=100,df2=500,ncp1=1.5,ncp2=12)
# should be nearly uniform:
## Not run: 
##D plot(ecdf(p1))
## End(Not run)
q1 <- qdnf(ppoints(length(rv)), df1=100,df2=500,ncp1=1.5,ncp2=12)
## Not run: 
##D qqplot(x=rv,y=q1)
## End(Not run)



