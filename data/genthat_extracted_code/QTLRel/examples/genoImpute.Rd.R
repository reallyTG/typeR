library(QTLRel)


### Name: genoImpute
### Title: Impute Genotypic Data
### Aliases: genoImpute

### ** Examples

data(miscEx)

# briefly look at genotype data
sum(is.na(gdatF8))
gdatF8[1:5,1:5]

## Not run: 
##D # run 'genoProb'
##D gdtmp<- gdatF8
##D    gdtmp<- replace(gdtmp,is.na(gdtmp),0)
##D prDat<- genoProb(gdat=gdtmp, gmap=gmapF8, step=Inf,
##D    gr=8, method="Haldane", msg=TRUE)
##D 
##D # imputation based on 'genoProb' object
##D tmp<- genoImpute(prd=prDat)
##D sum(is.na(tmp))
##D tmp[1:5,1:5]
##D 
##D # imputation based on both genotype data and 'genoProb' object
##D tmp<- genoImpute(gdatF8, prd=prDat)
##D sum(is.na(tmp))
##D tmp[1:5,1:5]
##D 
##D # imputation based on genotype data
##D tmp<- genoImpute(gdatF8, gmap=gmapF8, step=Inf,
##D    gr=8, na.str=NA)
##D sum(is.na(tmp))
##D tmp[1:5, 1:5]
##D # set "msg=TRUE" for more information
##D tmp<- genoImpute(gdatF8, gmap=gmapF8, step=Inf,
##D    gr=8, na.str=NA, msg=TRUE)
##D sum(is.na(tmp))
##D tmp[1:5, 1:5]
## End(Not run)



