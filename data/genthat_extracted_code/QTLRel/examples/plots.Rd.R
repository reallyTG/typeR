library(QTLRel)


### Name: plotit
### Title: Plotting
### Aliases: plot plotit plot.scanOne plot.scanTwo

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
##D # genome scan
##D llk<- scanOne(y=pheno$bwt, x=pheno$sex, vc=o, gdat=gdat.imp)
##D 
##D # plotting
##D plot(llk, gmap=gmapF8) # gmap is needed
##D 
##D # plotting in another way
##D idx<- match(colnames(gdat.imp), gmapF8$snp)
##D tmp<- data.frame(chr=gmapF8$chr[idx],dist=gmapF8$dist[idx],y=llk$p)
##D plotit(tmp, main="Mapping Plot", xlab="Chromosome", ylab="LRT",
##D    col=as.integer(tmp$ch)%%2+2,type="p")
## End(Not run)



