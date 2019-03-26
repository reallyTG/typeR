library(psych)


### Name: ICC
### Title: Intraclass Correlations (ICC1, ICC2, ICC3 from Shrout and
###   Fleiss)
### Aliases: ICC
### Keywords: multivariate

### ** Examples

sf <- matrix(c(
9,    2,   5,    8,
6,    1,   3,    2,
8,    4,   6,    8,
7,    1,   2,    6,
10,   5,   6,    9,
6,   2,   4,    7),ncol=4,byrow=TRUE)
colnames(sf) <- paste("J",1:4,sep="")
rownames(sf) <- paste("S",1:6,sep="")
sf  #example from Shrout and Fleiss (1979)
ICC(sf,lmer=FALSE)  #just use the aov procedure
   
data(sai)
sai.xray <- subset(sai,(sai$study=="XRAY") & (sai$time==1))
xray.icc <- ICC(sai.xray[-c(1:3)],lmer=TRUE,check.keys=TRUE)
xray.icc
xray.icc$lme  #show the variance components as well



