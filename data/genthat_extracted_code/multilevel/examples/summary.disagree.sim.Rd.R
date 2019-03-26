library(multilevel)


### Name: summary.disagree.sim
### Title: S3 method for class 'disagree.sim'
### Aliases: summary.disagree.sim
### Keywords: programming

### ** Examples

#Example from Dunlap et al. (2003), Table 3.  The listed significance
#value for a group of size 5 with a 7-item response format is 0.64 or less 
SIMOUT<-ad.m.sim(gsize=5, nitems=1, nresp=7, itemcors=NULL,
        type="mean", nrep=1000) 
summary(SIMOUT)



