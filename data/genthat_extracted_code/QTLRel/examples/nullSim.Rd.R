library(QTLRel)


### Name: nullSim
### Title: Simulate null distribution
### Aliases: nullSim

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
##D gdatTmp<- genoImpute(geno, gmap=gmapF8, step=Inf,
##D    gr=8, na.str=NA)
##D # estimate variance components
##D o<- estVC(y=pheno$bwt, x=pheno$sex, v=v)
##D 
##D # scan marker loci & permutation
##D ex1<- nullSim(y=pheno$bwt, x=pheno$sex, gdat=gdatTmp,
##D 	method="permutation", vc=o, ntimes=10)
##D dim(ex1)
##D 
##D # scan marker loci & gene dropping
##D ex2<- nullSim(y=pheno$bwt, x=pheno$sex, gdat=gdatTmp, ped=ped,
##D 	gmap=gmapF8, method="gene", vc=o, ntimes=10)
##D dim(ex2)
##D 
##D # Haley-Knott method & permutation
##D gdtmp<- geno
##D    gdtmp<- replace(gdtmp,is.na(gdtmp),0)
##D prDat<- genoProb(gdat=gdtmp, gmap=gmapF8, step=Inf,
##D    gr=8, method="Haldane", msg=TRUE)
##D ex3<- nullSim(y=pheno$bwt, x=pheno$sex, prdat=prDat,
##D 	method="permutation", vc=o, ntimes=10)
##D dim(ex3)
##D 
##D # Haley-Knott method & gene dropping
##D ex4<- nullSim(y=pheno$bwt, x=pheno$sex, prdat=prDat, ped=ped,
##D 	gmap=gmapF8, method="gene", vc=o, gr=8, ntimes=10)
##D dim(ex4)
## End(Not run)



