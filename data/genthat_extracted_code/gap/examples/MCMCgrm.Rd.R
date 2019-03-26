library(gap)


### Name: MCMCgrm
### Title: Mixed modeling with genetic relationship matrices
### Aliases: MCMCgrm
### Keywords: htest

### ** Examples

## Not run: 
##D ### with kinship
##D  
##D # library(kinship) 
##D # fam <- with(l51,makefamid(id,fid,mid))
##D # s <-with(l51, makekinship(fam, id, fid, mid))
##D # K <- as.matrix(s)*2   
##D 
##D ### with gap
##D 
##D s <- kin.morgan(l51)
##D K <- with(s,kin.matrix*2)
##D prior <- list(R=list(V=1, nu=0.002), G=list(G1=list(V=1, nu=0.002)))
##D m <- MCMCgrm(qt~1,prior,l51,K)
##D save(m,file="l51.m")
##D pdf("l51.pdf")
##D plot(m)
##D dev.off()
## End(Not run)



