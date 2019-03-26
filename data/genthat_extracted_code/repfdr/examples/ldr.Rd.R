library(repfdr)


### Name: ldr
### Title: Estimation of posterior probabilities for the vectors of
###   association status
### Aliases: ldr

### ** Examples


## Not run: 
##D download.file('http://www.math.tau.ac.il/~ruheller/repfdr_RData/binned_zmat.RData',
##D   destfile = "binned_zmat.RData")
##D load(file = "binned_zmat.RData")
##D   
##D data(Pi)
##D 
##D # Fdr calculation:
##D output3 <- repfdr(pbz, bz, "replication",Pi.previous.result = Pi)
##D 
##D BayesFdr <- output3$mat[,"Fdr"]
##D sum(BayesFdr <= 0.05)
##D 
##D # The posterior probabilities for the the first five features with Bayes FDR at most 0.05:
##D post <- ldr(pbz,bz[which(BayesFdr <= 0.05)[1:5],],Pi)
##D round(post,4)
##D 
##D # posteriors for a subset of the association status vectors can also be reported,
##D # here the subset is the four first association status vectors:
##D post <- ldr(pbz,bz[which(BayesFdr <= 0.05)[1:5],],Pi,h.vecs= 1:4)
##D round(post,4)
## End(Not run)



