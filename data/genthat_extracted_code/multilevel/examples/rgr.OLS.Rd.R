library(multilevel)


### Name: rgr.OLS
### Title: Random Group Resampling OLS Regression
### Aliases: rgr.OLS
### Keywords: attribute

### ** Examples

data(lq2002)
RGROUT<-rgr.OLS(lq2002$LEAD,lq2002$TSIG,lq2002$HOSTILE,lq2002$COMPID,100)

#Compare values to those reported on p.62 in Bliese & Halverson (2002)
summary(RGROUT)  



