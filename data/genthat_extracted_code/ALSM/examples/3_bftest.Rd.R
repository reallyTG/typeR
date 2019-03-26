library(ALSM)


### Name: bftest
### Title: Brown-Forsythe Test between two group
### Aliases: bftest

### ** Examples

################### EXAMPLE PAGE 117


### Group
g<-rep(1,25)
g[TolucaCompany$x<=70]=0
### TEST
bftest(lm(y~x,TolucaCompany),g)




