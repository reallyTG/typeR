library(qdap)


### Name: cm_df.fill
### Title: Range Coding
### Aliases: cm_df.fill
### Keywords: coding

### ** Examples

## Not run: 
##D codes <- qcv(dc, sf, wes, pol, rejk, lk, azx, mmm)
##D X <- cm_df.temp(DATA, "state", codes)
##D head(X, 10)
##D 
##D #recommended structure
##D cds1 <- list(
##D      dc=c(1:3, 5), 
##D      sf=c(4, 6:9, 11), 
##D      wes=0, 
##D      pol=0, 
##D      rejk=0,
##D      lk=0, 
##D      azx=1:30, 
##D      mmm=5
##D )
##D 
##D out1 <- cm_df.fill(X, cds1)
##D head(out1)
##D 
##D #recommended structure
##D cds2 <- list(
##D     sf=c(4, 6:9, 11), 
##D     dc=c(1:3, 5), 
##D     azx=1:30, 
##D     mmm=5
##D )
##D out2 <- cm_df.fill(X, cds2)
##D head(out2)
## End(Not run)



