library(DCGL)


### Name: DRplot
### Title: Visualization of DRLs
### Aliases: DRplot
### Keywords: visualization DRL

### ** Examples

data(exprs)
## divide exprs into two parts corresponding to condition 1 
## (exprs.1) and condition 2 (exprs.2) respectively
exprs.1<-exprs[1:100,1:16]
exprs.2<-exprs[1:100,17:63]
expGenes<-rownames(exprs)

data(tf2target)
DCp.res<-DCp(exprs.1,exprs.2,link.method = 'qth',cutoff=0.25)
DCe.res<-DCe(exprs.1,exprs.2,link.method = 'qth',cutoff=0.25,nbins=10,p=0.1)
DCsum.res<-DCsum(DCp.res,DCe.res,DCpcutoff=0.25,DCecutoff=0.4)
DRplot.res<-DRplot(DCsum.res$DCGs,DCsum.res$DCLs,
	tf2target,
	expGenes,
	type='TF_bridged_DCL',
	intgenelist=NULL,
	vsize=5,asize=0.25,lcex=0.3,ewidth=1,
	figname=c('TF2target_DCL.pdf','TF_bridged_DCL.pdf'))

## two types of Differentially Regulated Links which were plotted
DRplot.res$TF2target_DCL[1:3,]
DRplot.res$TF_bridged_DCL[1:3,]

## plot sub-network by predefined gene(s)
data(intgenelist)
DRplot.int.res<-DRplot(DCsum.res$DCGs,DCsum.res$DCLs,
	tf2target,
	expGenes,
	type='TF_bridged_DCL',
	intgenelist=intgenelist,
	vsize=5,asize=0.25,lcex=0.3,ewidth=1,
	figname=c('TF2target_DCL_int.pdf','TF_bridged_DCL_int.pdf'))
DRplot.int.res$TF2target_DCL[1:3,]
DRplot.int.res$TF_bridged_DCL[1:3,]




