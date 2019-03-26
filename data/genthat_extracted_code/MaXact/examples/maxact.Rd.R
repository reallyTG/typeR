library(MaXact)


### Name: Exact Max CATT Test
### Title: MAX CATT test in case-control genetic association analysis
### Aliases: MaXact maxact.test catt.test
### Keywords: htest

### ** Examples

data.sladek <- matrix(c(129, 326, 229, 198, 325, 143), 2, 3, byrow=TRUE)

## MAX3 test (exact p-value)
maxact.test(data.sladek) 

## MAX2 test (exact p-value):
maxact.test(data.sladek, max3=FALSE, exact=TRUE)


## MAX test (p-value calculated from the normal approximation method), it
## is not recommends, see NOTE for more information
 maxact.test(data.sladek, max3=TRUE, exact=FALSE)
 maxact.test(data.sladek, max3=FALSE, exact=FALSE)

## Cochran-Armitage trend test, assuming we know the model 
 catt.test(data.sladek, theta=0)    #recessive model
 catt.test(data.sladek, theta=0.5)  #additive model
 catt.test(data.sladek, theta=1)    #dominant model

#the  alternative hypothesis is less
 catt.test(data.sladek, theta=0, alternative="less") 





