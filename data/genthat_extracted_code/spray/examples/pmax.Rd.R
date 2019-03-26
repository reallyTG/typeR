library(spray)


### Name: pmax
### Title: Parallel maxima and minima for sprays
### Aliases: pmax pmin maxpair_spray minpair_spray pmax.spray pmin.spray
###   pmax.default pmin.default

### ** Examples


S1 <- rspray(100,vals=sample(100)-50)
S2 <- rspray(100,vals=sample(100)-50)
S3 <- rspray(100,vals=sample(100)-50)


# following comparisons should all be TRUE:

jj <- pmax(S1,S2,S3)
jj ==  maxpair_spray(S1,maxpair_spray(S2,S3))
jj ==  maxpair_spray(maxpair_spray(S1,S2),S3)

pmax(S1,S2,S3)  == -pmin(-S1,-S2,-S3)
pmin(S1,S2,S3)  == -pmax(-S1,-S2,-S3)

pmax(S1,-Inf) == S1
pmin(S1, Inf) == S2


pmax(S1,-3)

## Not run: 
##D pmax(S1,3) # not defined
## End(Not run)





