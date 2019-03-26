library(QTLRel)


### Name: estVC
### Title: Estimate Variance Component Parameters
### Aliases: estVC

### ** Examples

data(miscEx)

## Not run: 
##D # no sex effect
##D pheno<- pdatF8[!is.na(pdatF8$bwt) & !is.na(pdatF8$sex),]
##D ii<- match(rownames(pheno), rownames(gmF8$AA))
##D v<- list(A=gmF8$AA[ii,ii], D=gmF8$DD[ii,ii])
##D 
##D o<- estVC(y=pheno$bwt, v=v)
##D o
##D 
##D # sex as fixed effect
##D fo<- estVC(y=pheno$bwt, x=pheno$sex, v=v)
##D fo
##D 2*(fo$value-o$value) # log-likelihood test statistic
##D 
##D # sex as random effect
##D SM<- rem(~sex, data=pheno)
##D ro<- estVC(y=pheno$bwt, v=c(v,list(Sex=SM$sex)))
##D ro
##D 2*(ro$value-o$value) # log-likelihood test statistic
## End(Not run)



