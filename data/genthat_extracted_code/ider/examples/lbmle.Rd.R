library(ider)


### Name: lbmle
### Title: Maximum Likelihood Estimation of Intrinsic Dimension.
### Aliases: lbmle

### ** Examples

x <- gendata(DataName='SwissRoll',n=300)
estmle <- lbmle(x=x,k1=3,k2=5)
print(estmle)



