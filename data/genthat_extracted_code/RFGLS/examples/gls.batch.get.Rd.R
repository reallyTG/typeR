library(RFGLS)


### Name: gls.batch.get
### Title: Data restructuring for 'fgls()'.
### Aliases: gls.batch.get

### ** Examples

data(pheno)
data(geno)
data(map)
data(pedigree)
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
olsmod <- lm(   ##<--OLS regression could be applied to the merged dataset...
    Zscore ~ rs3934834 + IsFemale, data=foo$test.dat)
summary(olsmod)  ##<--...but the standard errors and t-statistics will not be valid.

##The 'tlist' vector can be useful for figuring out if any residual-covariance
##parameters are poorly identified in the data:
pheno2 <- subset(pheno, (pheno$INDIV<3 & pheno$FAMID>20) | 
                       (pheno$ID %in% c(11,12,13,21,22,23)))
foo2 <- gls.batch.get(
  phenfile=pheno2,
  genfile=data.frame(t(geno)),pedifile=pedigree,
  covmtxfile.in=NULL,theta=NULL,snp.names=map[,2],input.mode=c(1,2,3),
  pediheader=FALSE,pedicolname=c("FAMID","ID","PID","MID","SEX"),
  sep.phe=" ",sep.gen=" ",sep.ped=" ",
  phen="Zscore",covars="IsFemale",med=c("UN","VC"),
  outfile,col.names=TRUE,return.value=FALSE,
  covmtxfile.out=NULL,
  covmtxparams.out=NULL,
  sizeLab=NULL,Mz=NULL,Bo=NULL,Ad=NULL,Mix=NULL,indobs=NULL)
table(foo2$tlist)
##Only two families have the label 'ccm', that is, only two have 
##a mother.  So, if calling fgls()
##with med="UN", it would probably be a good idea to drop the
##mother variance [drop=10], or the biological mother-offspring 
##correlation [drop=2], or both [drop=c(2,10)].



