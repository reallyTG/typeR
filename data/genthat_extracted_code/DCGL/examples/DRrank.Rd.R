library(DCGL)


### Name: DRrank
### Title: Ranking Regulators by Target Enrichment Density (TED) and
###   Targets' DCL Density (TDD)
### Aliases: DRrank
### Keywords: Regulator Rank

### ** Examples

data(exprs)
## divide exprs into two parts corresponding to condition 1 
## (exprs.1) and condition 2 (exprs.2) respectively
expGenes<-rownames(exprs)
exprs<-exprs[1:100,]
exprs.1<-exprs[1:100,1:16]
exprs.2<-exprs[1:100,17:63]

data(tf2target)
DCp.res<-DCp(exprs.1,exprs.2,
	link.method = 'qth',cutoff=0.25)
DCe.res<-DCe(exprs.1,exprs.2,
	link.method = 'qth',cutoff=0.25,nbins=10,p=0.1)
DCsum.res<-DCsum(DCp.res,DCe.res,DCpcutoff=0.25,DCecutoff=0.4)

## rank all the potential TFs
data(tf2target)
DRrank.TED.res<-DRrank(DCsum.res$DCGs, DCsum.res$DCLs, 
	tf2target, expGenes,
	rank.method=c('TED','TDD')[1],
	Nperm=0)

DRrank.TED.res[1:3,]

DRrank.TDD.res<-DRrank(DCsum.res$DCGs, DCsum.res$DCLs, 
	tf2target, expGenes,
	rank.method=c('TED','TDD')[2],
	Nperm=0)

DRrank.TDD.res[1:3,]



