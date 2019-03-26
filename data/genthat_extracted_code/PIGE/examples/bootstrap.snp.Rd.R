library(PIGE)


### Name: bootstrap.snp
### Title: Parallel computing of the Likelihhod ratio test (or Wald test)
###   for an interaction term (or a simple SNP effect) on bootstrap sample
### Aliases: bootstrap.snp

### ** Examples

data(data.pige)
data(data.pathway)
data(list.gene.snp)
res <-data.to.PIGE(data=data.pige,data.pathway=data.pathway,
list.gene.snp=list.gene.snp,choice.pathway=c(1,2))
formul <- formula(y~factor(cov1)+factor(cov2)+factor(cov3)+factor(cov4)
+var_int)
debut <- Sys.time()
p.snp.boot.ex <-  bootstrap.snp(model=formul,data=data.pige,
indice.snp=res$snp.selected,var.inter="var_int",class.inter=NULL,
nbcpu=2,Nboot=2,file.out="res-boot")
print(Sys.time()-debut)



