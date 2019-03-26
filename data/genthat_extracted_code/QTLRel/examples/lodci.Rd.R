library(QTLRel)


### Name: lodci
### Title: Estimate LOD Support Intervals
### Aliases: lodci

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
##D # run 'genoProb'
##D prDat<- genoProb(gdat=gdtmp, gmap=gmapF8, step=Inf,
##D    gr=8, method="Haldane", msg=TRUE)
##D # estimate variance components
##D o<- estVC(y=pheno$bwt, x=pheno$sex, v=v)
##D 
##D # genome scan
##D llk.hk<- scanOne(y=pheno$bwt, x=pheno$sex, vc=o, prdat=prDat)
##D 
##D # extract LOD support intervals
##D tmp<- data.frame(y=llk.hk$p, chr=llk.hk$chr, dist=llk.hk$dist)
##D lodci(tmp, cv=10, lod=1.5, drop=3)
## End(Not run)



