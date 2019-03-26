library(multilevel)


### Name: ICC1
### Title: Function to Estimate Intraclass Correlation Coefficient 1 or
###   ICC(1) from an aov model
### Aliases: ICC1
### Keywords: attribute

### ** Examples

   data(bh1996)
   hrs.mod<-aov(HRS~as.factor(GRP),data=bh1996)
   ICC1(hrs.mod)



