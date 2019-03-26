library(RFGLS)


### Name: pedigree
### Title: Pedigree table
### Aliases: pedigree
### Keywords: datasets

### ** Examples

data(pedigree)
data(pheno)
data(geno)
data(map)

foo <- gls.batch.get(
  phenfile=pheno,genfile=data.frame(t(geno)),pedifile=pedigree,
  covmtxfile.in=NULL,theta=NULL,snp.names=map[,2],
  input.mode=1,
  pediheader=FALSE,pedicolname=c("FAMID","ID","PID","MID","SEX"),
  sep.phe=" ",sep.gen=" ",sep.ped=" ",
  phen="Zscore",covars="IsFemale",med=c("UN","VC"),
  outfile,col.names=TRUE,return.value=FALSE,
  covmtxfile.out=NULL,
  covmtxparams.out=NULL,
  sizeLab=NULL,Mz=NULL,Bo=NULL,Ad=NULL,Mix=NULL,indobs=NULL)
str(foo)

##Also works, since phenfile provides 'FTYPE' and 'INDIV',
##and input.mode=1:
pedigree2 <- pedigree
pedigree2[,-2] <- NA    ##<--Change all but column 'ID' to NA.
foo2 <- gls.batch.get(
  phenfile=pheno,genfile=data.frame(t(geno)),
  pedifile=pedigree2,                       ##<--Note change.
  covmtxfile.in=NULL,theta=NULL,snp.names=map[,2],
  input.mode=1, ##<-- =2 or =3 would need more pedifile columns
  pediheader=FALSE,pedicolname=c("FAMID","ID","PID","MID","SEX"),
  sep.phe=" ",sep.gen=" ",sep.ped=" ",
  phen="Zscore",covars="IsFemale",med=c("UN","VC"),
  outfile,col.names=TRUE,return.value=FALSE,
  covmtxfile.out=NULL,
  covmtxparams.out=NULL,
  sizeLab=NULL,Mz=NULL,Bo=NULL,Ad=NULL,Mix=NULL,indobs=NULL)
str(foo2)




