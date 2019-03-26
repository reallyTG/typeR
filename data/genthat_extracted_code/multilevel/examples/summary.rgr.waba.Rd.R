library(multilevel)


### Name: summary.rgr.waba
### Title: S3 method for class 'rgr.waba'
### Aliases: summary.rgr.waba
### Keywords: programming

### ** Examples

data(bh1996)

#estimate the actual group model
waba(bh1996$HRS,bh1996$WBEING,bh1996$GRP)

#create 100 pseudo group runs and summarize results
RWABA<-rgr.waba(bh1996$HRS,bh1996$WBEING,bh1996$GRP,100)
summary(RWABA)  



