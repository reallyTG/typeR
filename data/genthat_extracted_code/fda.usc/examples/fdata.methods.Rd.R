library(fda.usc)


### Name: fdata.methods
### Title: fdata S3 Group Generic Functions
### Aliases: Math.fdata Ops.fdata Summary.fdata
### Keywords: math

### ** Examples

#######################
#######################
data(tecator)
absor<-tecator$absorp.fdata
absor2<-fdata.deriv(absor,1)
absor<-absor2[1:5,1:4]
absor2<-absor2[1:5,1:4]
sum(absor)
round(absor,4)
log1<-log(absor)



