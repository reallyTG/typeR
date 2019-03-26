library(RFGLS)


### Name: gls.batch
### Title: Generalized least-squares batch analysis.
### Aliases: gls.batch

### ** Examples

data(pheno)
data(geno)
data(map)
data(pedigree)
data(rescovmtx)
minigwas <- gls.batch(
  phenfile=pheno,genfile=data.frame(t(geno)),pedifile=pedigree,
  covmtxfile.in=rescovmtx, #<--Precomputed, to save time.
  theta=NULL,snp.names=map[,2],input.mode=c(1,2,3),pediheader=FALSE, 
  pedicolname=c("FAMID","ID","PID","MID","SEX"),
  sep.phe=" ",sep.gen=" ",sep.ped=" ",
  phen="Zscore",covars="IsFemale",med=c("UN","VC"),
  outfile=NULL,col.names=TRUE,return.value=TRUE,
  covmtxfile.out=NULL,covmtxparams.out=NULL,
  sizeLab=NULL,Mz=NULL,Bo=NULL,Ad=NULL,Mix=NULL,indobs=NULL)
minigwas



