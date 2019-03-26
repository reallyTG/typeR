library(QTLRel)


### Name: scanOne
### Title: Genome Scan for QTL
### Aliases: scanOne

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
##D # estimate variance components
##D o<- estVC(y=pheno$bwt, x=pheno$sex, v=v)
##D 
##D # impute missing genotypes
##D gdtmp<- genoImpute(geno, gmap=gmapF8, step=Inf,
##D         gr=8, na.str=NA, msg=FALSE)
##D # genome scan and plotting
##D pv<- scanOne(y=pheno$bwt, x=pheno$sex, gdat=gdtmp, vc=o)
##D pv
##D plot(pv,gmap=gmapF8)
##D 
##D # Haley-Knott method
##D gdtmp<- geno; unique(unlist(gdtmp))
##D    gdtmp<- replace(gdtmp,is.na(gdtmp),0)
##D prDat<- genoProb(gdat=gdtmp, gmap=gmapF8, step=Inf,
##D    gr=8, method="Haldane", msg=TRUE)
##D pv.hk<- scanOne(y=pheno$bwt, x=pheno$sex, prdat=prDat, vc=o)
##D pv.hk
##D plot(pv.hk)
## End(Not run)



