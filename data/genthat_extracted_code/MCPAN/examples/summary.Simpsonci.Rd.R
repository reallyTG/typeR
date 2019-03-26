library(MCPAN)


### Name: summary.Simpsonci
### Title: Summary function for Simpsonci
### Aliases: summary.Simpsonci
### Keywords: print

### ** Examples


data(HCD)

HCDcounts<-HCD[,-1]
HCDf<-HCD[,1]

SimpsonS<-Simpsonci(X=HCDcounts, f=HCDf, type = "Sequen",
 alternative = "greater", conf.level = 0.95, dist = "MVN")

summary(SimpsonS)




