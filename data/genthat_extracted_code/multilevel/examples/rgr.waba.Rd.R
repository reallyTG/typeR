library(multilevel)


### Name: rgr.waba
### Title: Random Group Resampling of Covariance Theorem Decomposition
### Aliases: rgr.waba
### Keywords: attribute

### ** Examples

# This example is from Bliese & Halverson (1996). Notice that all of the
# values from the RGR analysis differ from the values based on actual
# group membership.  Confidence intervals for individual components can
# be estimated using the quantile command.

data(bh1996)

#estimate the actual group model
waba(bh1996$HRS,bh1996$WBEING,bh1996$GRP)

#create 100 pseudo group runs and summarize the model        
RWABA<-rgr.waba(bh1996$HRS,bh1996$WBEING,bh1996$GRP,100)  
summary(RWABA)

#Estimate 95th percentile confidence intervals (p=.05)                     
quantile(RWABA,c(.025,.975))       



