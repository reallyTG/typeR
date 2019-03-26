library(MAc)


### Name: agg
### Title: Meta-Analysis Aggregation
### Aliases: agg
### Keywords: aggregation

### ** Examples

id<-rep(1:5, 4)
n<-c(10,20,13,22,28,12,12,36,19,12,36,75,33,121,37,14,40,16,14,20)
r<-c(.68,.56,.23,.64,.49,-.04,.49,.33,.58,.18,-.11,.27,.26,.40,.49,
.51,.40,.34,.42,.16)
mod1<-factor(rep(1:2, 10))
dat<-data.frame(id,n,r,mod1)

# Examples

# aggregate to 1 id per study (independent sample)
agg(id = id, r = r, n = n, data=dat) 

# aggregate by id & a moderator (non-independent sample)
temp <- agg(id = id, r = r, n = n, mod = mod1, data=dat) 

temp

# This function below will randomly select one within
# study level of the moderator (if there are more than one) and output an
# independent sample. Replace temp with the name of your data.
do.call(rbind, lapply(split(temp, temp$id), 
          function(.data) .data[sample(nrow(.data), 1),]))





