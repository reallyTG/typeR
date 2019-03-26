library(RATest)


### Name: RPT
### Title: Robust Permutation Test
### Aliases: RPT
### Keywords: permutation robust rpt test

### ** Examples

## Not run: 
##D male<-rnorm(50,1,1)
##D female<-rnorm(50,1,2)
##D dta<-data.frame(group=c(rep(1,50),rep(2,50)),outcome=c(male,female))
##D rpt.var<-RPT(dta$outcome~dta$group,test="variances")
##D summary(rpt.var)
##D 
## End(Not run)



