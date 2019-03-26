library(QTLRel)


### Name: blup
### Title: Best Linear Unbiased Prediction
### Aliases: blup

### ** Examples

data(miscEx)

## Not run: 
##D # only consider additive genetic variance component
##D pheno<- pdatF8[!is.na(pdatF8$bwt) & !is.na(pdatF8$sex),]
##D ii<- match(rownames(pheno), rownames(gmF8$AA))
##D v<- list(A=gmF8$AA[ii,ii],D=gmF8$DD[ii,ii])
##D vc<- estVC(y=pheno$bwt, x=pheno$sex, v=v)
##D b<- blup(vc)
## End(Not run)



