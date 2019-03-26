library(multilevel)


### Name: ICC2
### Title: Function to Estimate Intraclass Correlation Coefficient 2 or
###   ICC(2) from an aov model
### Aliases: ICC2
### Keywords: attribute

### ** Examples

   data(bh1996)
   hrs.mod<-aov(HRS~as.factor(GRP),data=bh1996)
   ICC2(hrs.mod)



