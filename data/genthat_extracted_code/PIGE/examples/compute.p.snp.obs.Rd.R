library(PIGE)


### Name: compute.p.snp.obs
### Title: Likelihhod ratio test (or Wald test) for an interaction term (or
###   a single SNP effect)
### Aliases: compute.p.snp.obs

### ** Examples

data(data.pige)
## Case-control study:
data(data.pathway)
data(list.gene.snp)
res <-data.to.PIGE(data=data.pige,data.pathway=data.pathway,
list.gene.snp=list.gene.snp,choice.pathway=c(1,2))
formul <- formula(y~factor(cov1)+factor(cov2)+factor(cov3)+factor(cov4)
+var_int)
p.snp.obs.ex <-  compute.p.snp.obs(data=data.pige,model=formul,
indice.snp=res$snp.selected,var.inter="var_int",class.inter=NULL)

## Survival analysis
data(data.surv)
data(data.pathway.surv)
data(list.gene.snp.surv)
res1 <-data.to.PIGE(data=data.surv,data.pathway=data.pathway.surv,
list.gene.snp=list.gene.snp.surv,choice.pathway=c(1:7))
formul <- formula(Surv(TIME, EVENT) ~ var_int)
p.snp.obs.ex <- compute.p.snp.obs(data=data.surv,Outcome.model="surv"
,model=formul,indice.snp=res1$snp.selected,var.inter="var_int"
,class.inter=NULL,file.out="res-obs-surv")



