library(sadists)


### Name: dnt
### Title: The doubly non-central t distribution.
### Aliases: ddnt dnt pdnt qdnt rdnt
### Keywords: distribution

### ** Examples

rvs <- rdnt(128, 20, 1, 1)
dvs <- ddnt(rvs, 20, 1, 1)
pvs.H0 <- pdnt(rvs, 20, 0, 1)
pvs.HA <- pdnt(rvs, 20, 1, 1)
## Not run: 
##D plot(ecdf(pvs.H0))
##D plot(ecdf(pvs.HA))
## End(Not run)
# compare to singly non-central
dv1 <- ddnt(1, df=10, ncp1=5, ncp2=0, log=FALSE)
dv2 <- dt(1, df=10, ncp=5, log=FALSE)
pv1 <- pdnt(1, df=10, ncp1=5, ncp2=0, log.p=FALSE)
pv11 <- pdnt(1, df=10, ncp1=5, ncp2=0.001, log.p=FALSE)
v2 <- pt(1, df=10, ncp=5, log.p=FALSE)

q1 <- qdnt(pv1, df=10, ncp1=5, ncp2=0, log.p=FALSE)



