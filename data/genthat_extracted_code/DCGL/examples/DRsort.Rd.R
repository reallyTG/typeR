library(DCGL)


### Name: DRsort
### Title: Identify DRGs (Differential regulated Genes) and DRLs
###   (Differential regulated Links)
### Aliases: DRsort
### Keywords: DRGs DRLs

### ** Examples

data(exprs)
data(tf2target)
expGenes<-rownames(exprs[1:100,])

## Two differential co-expression analysis methods
DCp.res<-DCp(exprs[1:100,1:16],exprs[1:100,17:63],
	link.method = 'qth',cutoff=0.25)
DCe.res<-DCe(exprs[1:100,1:16],exprs[1:100,17:63],
	link.method = 'qth',cutoff=0.25,nbins=20,p=0.1)

## Summarizing DCGs and DCLs from DCp and DCe derived results
DCsum.res<-DCsum(DCp.res,DCe.res,DCpcutoff=0.25,DCecutoff=0.25)

## Sorting out DRGs and DRLs from DCsum-outputted results
DRsort.res<-DRsort(DCsum.res$DCGs,DCsum.res$DCLs,tf2target,expGenes)
## or only sorting out DRGs and DRLs from DCe-outputted results
DRsort.res<-DRsort(DCe.res$DCGs,DCe.res$DCLs,tf2target,expGenes)


## DRGs list
DRsort.res$DRGs[1:3,]

## DRLs list
DRsort.res$DRLs[1:3,]



