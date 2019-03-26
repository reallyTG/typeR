library(sadists)


### Name: proddnf
### Title: The product of multiple doubly non-central F's distribution.
### Aliases: dproddnf pproddnf proddnf qproddnf rproddnf
### Keywords: distribution

### ** Examples

df1 <- c(10,20,5)
df2 <- c(1000,500,150)
ncp1 <- c(1,0,2.5)
ncp2 <- c(0,1.5,5)

rv <- rproddnf(500, df1=df1,df2=df2,ncp1=ncp1,ncp2=ncp2)
d1 <- dproddnf(rv, df1=df1,df2=df2,ncp1=ncp1,ncp2=ncp2)
## Not run: 
##D plot(rv,d1)
## End(Not run)
p1 <- pproddnf(rv, df1=df1,df2=df2,ncp1=ncp1,ncp2=ncp2)
# should be nearly uniform:
## Not run: 
##D plot(ecdf(p1))
## End(Not run)
q1 <- qproddnf(ppoints(length(rv)), df1=df1,df2=df2,ncp1=ncp1,ncp2=ncp2)
## Not run: 
##D qqplot(x=rv,y=q1)
## End(Not run)



