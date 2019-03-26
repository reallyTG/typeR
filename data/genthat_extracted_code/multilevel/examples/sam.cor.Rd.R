library(multilevel)


### Name: sam.cor
### Title: Generate a Sample that Correlates with a Fixed Set of
###   Observations
### Aliases: sam.cor
### Keywords: programming

### ** Examples

   data(bh1996)
   NEWVAR<-sam.cor(x=bh1996$LEAD,rho=.30)
   cor(bh1996$LEAD,NEWVAR)



