library(QTLRel)


### Name: aicVC
### Title: AIC Model Selection
### Aliases: aicVC

### ** Examples

data(miscEx)

## Not run: 
##D # forward selection
##D # any variance component will be selected
##D # if AIC improve by 1e-5 or larger
##D pheno<- pdatF8[!is.na(pdatF8$bwt) & !is.na(pdatF8$sex),]
##D ii<- match(rownames(pheno), rownames(gmF8$AA))
##D v<- list(A=gmF8$AA[ii,ii], D=gmF8$DD[ii,ii])
##D 
##D o<- aicVC(y=pheno$bwt, x=pheno$sex, k=0, v=v, msg=TRUE)
##D o
##D 
##D # forward selection
##D of<- aicVC(y=pheno$bwt, x=pheno$sex, v=v, k=1/2,
##D 	direction="for", msg=TRUE)
##D of
##D 
##D # backward elimination
##D ob<- aicVC(y=pheno$bwt, x=pheno$sex, v=v, k=1/2, init=1:2,
##D 	direction="back", msg=TRUE)
##D ob
## End(Not run)



