library(DSviaDRM)


### Name: DCpathway
### Title: Calculate differential co-expression values (dCs) for each
###   pathways
### Aliases: DCpathway
### Keywords: differential co-expression pathway

### ** Examples

data(exprs1)
data(exprs2)
data(exprs3)

##########################################################################
## the default value of cutoff in DCEA is 0.25, 
## here cutoff is set to 1 for saving time when demonstrating the examples.
DCEA.AA.res<-DCEA(exprs1[1:200,1:5],exprs1[1:200,6:10],link.method="percent",
	cutoff=1,N=0,nbins=20,p=0.1) 
##########################################################################

##########################################################################
## computate dCs of pathways for disease
data(pathways)
DCpathway.AA.res<-DCpathway(DCEA.res=DCEA.AA.res, DisName="AA",pathways)
DCpathway.AA.res[1:3,]
##########################################################################




