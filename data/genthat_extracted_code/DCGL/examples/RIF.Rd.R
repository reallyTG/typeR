library(DCGL)


### Name: RIF
### Title: Ranking Regulators by Regulator Impact Factor (RIF) Method
### Aliases: RIF
### Keywords: Regulator Rank

### ** Examples

data(exprs)
## divide exprs into two parts corresponding to condition 1 
## (exprs.1) and condition 2 (exprs.2) respectively
exprs<-exprs[1:100,]
exprs.1<-exprs[1:100,1:16]
exprs.2<-exprs[1:100,17:63]

DCp.res<-DCp(exprs.1,exprs.2,
	link.method = 'qth',cutoff=0.25)
DCe.res<-DCe(exprs.1,exprs.2,
	link.method = 'qth',cutoff=0.25,nbins=10,p=0.1)
DCsum.res<-DCsum(DCp.res,DCe.res,DCpcutoff=0.25,DCecutoff=0.4)

## rank all the potential TFs
data(tf2target)
data(exprs_design)
## No test: 
RIF.res<-RIF(exprs,exprs.1,exprs.2,
	tf2target,
	exprs_design,
	p.value=0.05)
## End(No test)
## No test: 
RIF.res[1:3,]
## End(No test)



