library(multilevel)


### Name: quantile.rgr.waba
### Title: S3 method for class 'rgr.waba'
### Aliases: quantile.rgr.waba
### Keywords: programming

### ** Examples

data(bh1996)

#estimate the model based on actual group membership
waba(bh1996$HRS,bh1996$WBEING,bh1996$GRP)

#create 100 pseudo group runs and summarize        
RWABA<-rgr.waba(bh1996$HRS,bh1996$WBEING,bh1996$GRP,100)  
quantile(RWABA,confint=c(.025,.975))  



