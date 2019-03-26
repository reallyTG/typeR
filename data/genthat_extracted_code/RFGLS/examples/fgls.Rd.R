library(RFGLS)


### Name: fgls
### Title: Feasible Generalized Least Squares regression with family GWAS
###   data.
### Aliases: fgls

### ** Examples

data(pheno)
data(geno)
data(map)
data(pedigree)
data(rescovmtx)
foo <- gls.batch.get(
  phenfile=pheno,genfile=data.frame(t(geno)),pedifile=pedigree,
  covmtxfile.in=NULL,theta=NULL,snp.names=map[,2],input.mode=c(1,2,3),
  pediheader=FALSE,pedicolname=c("FAMID","ID","PID","MID","SEX"),
  sep.phe=" ",sep.gen=" ",sep.ped=" ",
  phen="Zscore",covars="IsFemale",med=c("UN","VC"),
  outfile,col.names=TRUE,return.value=FALSE,
  covmtxfile.out=NULL,
  covmtxparams.out=NULL,
  sizeLab=NULL,Mz=NULL,Bo=NULL,Ad=NULL,Mix=NULL,indobs=NULL)

bar <- fgls(
  Zscore ~ rs3934834 + IsFemale, data=foo$test.dat, tlist=foo$tlist,
  sizelist=foo$sizelist,med=c("UN","VC"), 
  vmat=rescovmtx, #<--Resid. cov. matrix from fgls onto IsFemale only.
  start=NULL, theta=NULL, drop=NULL, get.hessian=FALSE, 
  optim.method="BFGS", control=list(), weights=NULL,
  sizeLab=NULL,Mz=NULL,Bo=NULL,Ad=NULL,Mix=NULL,indobs=NULL)

bar$ctable
##  To simultaneously estimate residual covariance matrix
##  and regression coefficients for rs3934834 & IsFemale,
##  use the same syntax, except with vmat = NULL .



