library(DBfit)


### Name: hypothmat
### Title: General Linear Tests of the regression coefficients
### Aliases: hypothmat

### ** Examples

data(testdata)
y<-testdata[,5]
x<-testdata[,1:4]
fit1<-dbfit(x,y,1) # OLS fit, default
# a test that H0: b1 = b3 vs HA: b1 != b3
mat<-matrix(c(1,0,0,-1),nrow=1) 
hypothmat(sfit=fit1,mmat=mat,n=40,p=4)



