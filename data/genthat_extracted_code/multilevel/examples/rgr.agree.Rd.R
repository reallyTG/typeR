library(multilevel)


### Name: rgr.agree
### Title: Random Group Resampling for Within-group Agreement
### Aliases: rgr.agree
### Keywords: attribute

### ** Examples


data(bh1996)
RGROUT<-rgr.agree(bh1996$HRS,bh1996$GRP,1000)
summary(RGROUT)



