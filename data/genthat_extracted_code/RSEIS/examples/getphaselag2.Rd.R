library(RSEIS)


### Name: getphaselag2
### Title: Phase Lag
### Aliases: getphaselag2
### Keywords: misc

### ** Examples

data("GH")

Xamp1<-GH$JSTR[[1]]
Xamp1<-Xamp1[1123:2000]

Xamp2<- GH$JSTR[[4]]
Xamp2<-Xamp2[1123:2000]
plot(Xamp1,type='l')
lines(Xamp2,type='l',col='red')

 pshift <- getphaselag2(Xamp1, Xamp2,  DT=GH$info$dt[1],
 frange=c(5, 15),  PLOT=TRUE)




