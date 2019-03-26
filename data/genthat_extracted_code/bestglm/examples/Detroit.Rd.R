library(bestglm)


### Name: Detroit
### Title: Detroit homicide data for 1961-73 used in the book Subset
###   Regression by A.J. Miller
### Aliases: Detroit
### Keywords: datasets

### ** Examples

#Detroit data example
data(Detroit)
#As in Miller (2002) columns 1-11 are used as inputs
p<-11
#For possible comparison with other algorithms such as LARS
#  it is preferable to work with the scaled inputs.
#From Miller (2002, Table 3.14), we see that the
#best six inputs are: 1, 2, 4, 6, 7, 11
X<-as.data.frame(scale(Detroit[,c(1,2,4,6,7,11)]))
y<-Detroit[,ncol(Detroit)]
Xy<-cbind(X,HOM=y)
#Use backward stepwise regression with BIC selects full model
out <- lm(HOM~., data=Xy)
step(out, k=log(nrow(Xy)))
#
#Same story with exhaustive search algorithm
out<-bestglm(Xy, IC="BIC")
out
#But many coefficients have p-values that are quite large considering
#  the selection bias. Note: 1, 6 and 7 are all about 5% only.
#We can use BICq to reduce the number of variables.
#The qTable let's choose q for other possible models,
out$qTable
#This suggest we try q=0.05 or q=0.0005 
bestglm(Xy,IC="BICq", t=0.05)
bestglm(Xy,IC="BICq", t=0.00005)
#It is interesting that the subset model of size 2 is not a subset
# itself of the size 3 model. These results agree with 
#Miller (2002, Table 3.14).
#
#Using delete-d CV with d=4 suggests variables 2,4,6,11
set.seed(1233211)
bestglm(Xy, IC="CV", CVArgs=list(Method="d", K=4, REP=50))



