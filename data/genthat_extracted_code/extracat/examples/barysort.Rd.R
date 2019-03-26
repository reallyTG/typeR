library(extracat)


### Name: barysort
### Title: row and column moment reordering
### Aliases: barysort

### ** Examples

# a good and quick solution:
a <- arsim(2000,c(24,24),6, noise=0.4)
fluctile(a2<-barysort(a))
BCI(a2)

# which is near
a3 <- optile(a, iter=100)
BCI(a3)


## Not run: 
##D a <- arsim(64000,c(256,256),16, noise=0.4)
##D s1 <- system.time( bci1 <- BCI(a1<-optile(a, fun = "barysort", 
##D foreign=".Call", iter = 1)) )[[3]]
##D 
##D s2 <- system.time( bci2 <- BCI(a2<-optile(a, iter=1)) )[[3]]
##D s3 <- system.time( bci3 <- BCI(a3<-optile(a, fun="IBCC",iter=1)) )[[3]]
## End(Not run)




