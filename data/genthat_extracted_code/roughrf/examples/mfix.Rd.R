library(roughrf)


### Name: mfix
### Title: Four single imputation methods
### Aliases: mfix

### ** Examples

dat=data.frame(continuous=c(1,2,3,4,5),categorical=c('a','a','a','a','b'))
dat[2,]=NA
dat
summary(dat)
mfix(dat,1)[2,]  #median/mode imputation
mfix(dat,2)[2,]  #mean/mode imputation
mfix(dat,3)[2,]  #minimum-value/mode imputation
mfix(dat,4)[2,]  #maximum-value/mode imputation
#



