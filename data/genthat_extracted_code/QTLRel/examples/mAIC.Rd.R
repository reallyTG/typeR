library(QTLRel)


### Name: mAIC
### Title: Multiple QTL AIC
### Aliases: mAIC mAIC.HK

### ** Examples

data(miscEx)

## Not run: 
##D # impute missing genotypes
##D pheno<- pdatF8[!is.na(pdatF8$bwt) & !is.na(pdatF8$sex),]
##D ii<- match(rownames(pheno), rownames(gdatF8))
##D geno<- gdatF8[ii,]
##D ii<- match(rownames(pheno), rownames(gmF8$AA))
##D v<- list(A=gmF8$AA[ii,ii], D=gmF8$DD[ii,ii])
##D 
##D gdat.imp<- genoImpute(geno, gmap=gmapF8, step=Inf,
##D    gr=8, na.str=NA)
##D # estimate variance components
##D o<- estVC(y=pheno$bwt, x=pheno$sex, v=v)
##D 
##D # run 'genoProb'
##D gdtmp<- geno
##D    gdtmp<- replace(gdtmp,is.na(gdtmp),0)
##D prDat<- genoProb(gdat=gdtmp, gmap=gmapF8, step=Inf,
##D    gr=8, method="Haldane", msg=TRUE)
##D 
##D # genome scan
##D llk.hk<- scanOne(y=pheno$bwt, x=pheno$sex, prdat=prDat, vc=o)
##D xin<- llk.hk$p > 10
##D 
##D # run 'mAIC' based on genome scan results
##D mg<- mAIC(y=pheno$bwt, x=pheno$sex, prdat=prDat, vc=o, xin=xin,
##D    k=5, direction="back", msg=TRUE)
##D mg$model$value # likelihood of the final model
## End(Not run)



