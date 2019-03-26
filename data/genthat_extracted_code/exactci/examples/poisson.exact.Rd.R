library(exactci)


### Name: poisson.exact
### Title: Exact Poisson tests with Matching Confidence Intervals
### Aliases: poisson.exact
### Keywords: htest

### ** Examples

### Suppose you have observed rates of  2 out of 17877 in group A 
### and 10 out of 20000 in group B
### poisson.test gives non-matching confidence intervals
### i.e., p-value using  'minlike' criteria but confidence interval using 'central' criteria
poisson.test(c(2,10),c(17877,20000))
### poisson.exact gives matching CI to the p-values
### defaults to 'central' two-sided method
poisson.exact(c(2,10),c(17877,20000))
### other options
poisson.exact(c(2,10),c(17877,20000),tsmethod="minlike")
poisson.exact(c(2,10),c(17877,20000),tsmethod="blaker")


## Mid-p confidence intervals do not guarantee coverage, 
## but are more likely to have on average closer nominal 
## coverage than exact ones (sometimes erroring on the 
## too liberal side). 
##
## To test the software, here is Table I of Cohen and Yang
## values are equal to the first 2 decimal places
yCY<-c(0:20,20+(1:5)*2,30+(1:14)*5)
TableICohenYang<-matrix(NA,length(yCY),6,dimnames=list(yCY,
    c("90pct LL","90pct UL","95pct LL","95pct UL","99pct LL","99pct UL")))

for (i in 1:length(yCY)){
    TableICohenYang[i,1:2]<-poisson.exact(yCY[i],
        midp=TRUE,conf.level=.9)$conf.int
    TableICohenYang[i,3:4]<-poisson.exact(yCY[i],
        midp=TRUE,conf.level=.95)$conf.int
    TableICohenYang[i,5:6]<-poisson.exact(yCY[i],
        midp=TRUE,conf.level=.99)$conf.int
}
TableICohenYang<-round(TableICohenYang,3)
TableICohenYang




