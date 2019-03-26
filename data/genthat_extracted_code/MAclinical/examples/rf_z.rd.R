library(MAclinical)


### Name: rf_z
### Title: Class prediction based on random forests using clinical
###   parameters only
### Aliases: rf_z
### Keywords: htest

### ** Examples

# load MAclinical library
# library(MAclinical)

# Generating zlearn, ylearn, ztest
zlearn<-matrix(rnorm(120),30,4)
ylearn<-sample(0:1,30,replace=TRUE)
ztest<-matrix(rnorm(80),20,4)

my.prediction<-rf_z(Zlearn=zlearn,Ylearn=ylearn,Ztest=ztest)
my.prediction



