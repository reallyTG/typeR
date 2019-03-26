library(QTLRel)


### Name: genoProb
### Title: Probability of a Genotype.
### Aliases: genoProb

### ** Examples

data(miscEx)

## Not run: 
##D # briefly look at genotype data
##D sum(is.na(gdatF8))
##D gdatF8[1:5,1:5]
##D 
##D gdtmp<- gdatF8
##D    gdtmp<- replace(gdtmp,is.na(gdtmp),0)
##D # In case an individual is not imputable, then
##D # one needs to assign genotypes manually
##D prDat<- genoProb(gdat=gdtmp, gmap=gmapF8, step=Inf,
##D    gr=8, method="Haldane", msg=TRUE)
##D prDat$pr[1:5,,1:5]
## End(Not run)



