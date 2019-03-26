library(TSA)


### Name: tlrt
### Title: Likelihood ratio test for threshold nonlinearity
### Aliases: tlrt
### Keywords: methods

### ** Examples

data(spots)
pvaluem=NULL
for (d in 1:5){
res=tlrt(sqrt(spots),p=5,d=d,a=0.25,b=0.75)
pvaluem= cbind( pvaluem, round(c(d,signif(c(res$test.statistic, 
res$p.value))),3))
}
rownames(pvaluem)=c('d','test statistic','p-value')
pvaluem



