library(QTLRel)


### Name: qtlVar
### Title: QTL Variance
### Aliases: qtlVar

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
##D gdtmp<- geno
##D    gdtmp<- replace(gdtmp,is.na(gdtmp),0)
##D # rung 'genoProb'
##D prDat<- genoProb(gdat=gdtmp, gmap=gmapF8, step=Inf,
##D    gr=8, method="Haldane", msg=TRUE)
##D # estimate variance components
##D o<- estVC(y=pheno$bwt, x=pheno$sex, v=v)
##D 
##D # genome scan
##D pv.hk<- scanOne(y=pheno$bwt, x=pheno$sex, prdat=prDat, vc=o)
##D 
##D # run 'qtlVar'
##D qef<- NULL
##D for(n in 1:length(pv.hk$par))
##D    qef<- rbind(qef,pv.hk$par[[n]][c("a","d")])
##D    qef<- as.data.frame(qef)
##D qtlVar(qef,prDat$pr)[1:3]
## End(Not run)



