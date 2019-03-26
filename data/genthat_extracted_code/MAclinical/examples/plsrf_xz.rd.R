library(MAclinical)


### Name: plsrf_xz
### Title: Classification based on PLS dimension reduction and random
###   forests using both clinical and microarray predictors
### Aliases: plsrf_xz
### Keywords: htest

### ** Examples

# load MAclinical library
# library(MAclinical)

# Generating xlearn, zlearn, ylearn, xtest, ztest
xlearn<-matrix(rnorm(3000),30,100)
zlearn<-matrix(rnorm(120),30,4)
ylearn<-sample(0:1,30,replace=TRUE)
xtest<-matrix(rnorm(2000),20,100)
ztest<-matrix(rnorm(80),20,4)

my.prediction1<-plsrf_xz(Xlearn=xlearn,Zlearn=zlearn,Ylearn=ylearn,Xtest=xtest,Ztest=ztest)

ordered<-sample(100)
my.prediction2<-plsrf_xz(Xlearn=xlearn,Zlearn=zlearn,Ylearn=ylearn,
Xtest=xtest,Ztest=ztest,ordered=ordered,nbgene=20)





