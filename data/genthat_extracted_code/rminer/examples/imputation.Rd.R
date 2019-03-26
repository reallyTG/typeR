library(rminer)


### Name: imputation
### Title: Missing data imputation (e.g. substitution by value or hotdeck
###   method).
### Aliases: imputation
### Keywords: manip

### ** Examples

d=matrix(ncol=5,nrow=5)
d[1,]=c(5,4,3,2,1)
d[2,]=c(4,3,4,3,4)
d[3,]=c(1,1,1,1,1)
d[4,]=c(4,NA,3,4,4)
d[5,]=c(5,NA,NA,2,1)
d=data.frame(d); d[,3]=factor(d[,3])
print(d)
print(imputation("value",d,3,Value="3"))
print(imputation("value",d,2,Value=median(na.omit(d[,2]))))
print(imputation("value",d,2,Value=c(1,2)))
print(imputation("hotdeck",d,"X2",Value=1))
print(imputation("hotdeck",d,Value=1))

## Not run: 
##D # hotdeck 1-nearest neighbor substitution on a real dataset:
##D d=read.table(
##D    file="http://archive.ics.uci.edu/ml/machine-learning-databases/autos/imports-85.data",
##D    sep=",",na.strings="?")
##D print(summary(d))
##D d2=imputation("hotdeck",d,Value=1)
##D print(summary(d2))
##D par(mfrow=c(2,1))
##D hist(d$V26)
##D hist(d2$V26)
##D par(mfrow=c(1,1)) # reset mfrow
## End(Not run)




