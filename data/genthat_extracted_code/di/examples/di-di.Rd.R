library(di)


### Name: di
### Title: This function calculates the Deficit Index (DI) and returns
###   results as list: 'di' a column-vector containing deficit indexes for
###   each individual and 'columns' that were used to calculate the 'di'.
### Aliases: di

### ** Examples

library(di)
dd <- data.frame(subj=seq(1:100), 
                 var1=rbinom(100,1,.5), 
                 var2=rbinom(100,1,.5), 
                 var3=rbinom(100,1,.5))
ddi <- di(dd, c("var1", "var2", "var3"))

# Cusom rescaling
ddi <- di(dd, c("var1", "var2", "var3"), rescale.custom=c("var1:0.1:0.5"))
ddi



