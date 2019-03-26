library(PIGE)


### Name: permutation.snp
### Title: Parallel computing of the Likelihhod ratio test (or Wald test)
###   for an interaction term (or a simple SNP effect) on permutation
###   sample
### Aliases: permutation.snp

### ** Examples

	
data(data.pige)
data(data.pathway)
data(list.gene.snp)
res <-data.to.PIGE(data=data.pige,data.pathway=data.pathway,
list.gene.snp=list.gene.snp,choice.pathway=c(1,2))
formul <- formula(y~factor(cov1)+factor(cov2)+factor(cov3)+factor(cov4)
+var_int)
debut <- Sys.time() 
p.snp.permut.ex <-  permutation.snp(model=formul,data=data.pige,
indice.snp=res$snp.selected,var.inter="var_int",class.inter=NULL,nbcpu=2,
Npermut=2,file.out="res-permut") 
print(Sys.time()-debut)
## Not run: 
##D ##Survival example:
##D data(data.surv)
##D data(data.pathway.surv)
##D data(list.gene.snp.surv)
##D res1 <-data.to.PIGE(data=data.surv,data.pathway=data.pathway.surv,
##D list.gene.snp=list.gene.snp.surv,choice.pathway=c(1:7))
##D formul <- formula(Surv(TIME, EVENT) ~ var_int)
##D p.snp.permut.ex <-  permutation.snp(model=formul,Outcome.model="surv"
##D ,data=data.surv,indice.snp=res1$snp.selected,var.inter="var_int",
##D class.inter=NULL,nbcpu=3,Npermut=9,file.out="res-permut-surv")
##D ##YwithinX example:
##D data(data.pathway)
##D data(list.gene.snp)
##D res <-data.to.PIGE(data=data.pige,data.pathway=data.pathway,
##D list.gene.snp=list.gene.snp,choice.pathway=c(1,2))
##D formul <- formula(y~factor(cov1)+factor(cov2)+factor(cov3)+factor(cov4)
##D +var_int)
##D debut <- Sys.time() 
##D p.snp.permut.ex <-  permutation.snp(model=formul,data=data.pige, method = "YwithinX",
##D indice.snp=res$snp.selected,var.inter="var_int",class.inter=NULL,nbcpu=3,
##D Npermut=9,file.out="res-permut") 
##D print(Sys.time()-debut)
## End(Not run)



