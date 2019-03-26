library(DCGL)


### Name: DCsum
### Title: Summarize DCGs and DCLs
### Aliases: DCsum
### Keywords: Summary of DCGs Summary of DCLs

### ** Examples

data(exprs)
DCp.res<-DCp(exprs[1:100,1:16],exprs[1:100,17:63],
	link.method = 'qth',cutoff=0.25)
DCe.res<-DCe(exprs[1:100,1:16],exprs[1:100,17:63],
	link.method = 'qth',cutoff=0.25,nbins=20,p=0.1)
DCsum.res<-DCsum(DCp.res,DCe.res,DCpcutoff=0.25,DCecutoff=0.25)

## Differentially Coexpressed Genes after combination
DCsum.res$DCGs[1:3,]

## Differentially Coexpressed Links after combination
DCsum.res$DCLs[1:3,]



