library(protViz)


### Name: pressureProfile
### Title: NanoLC pressure profile
### Aliases: pressureProfile
### Keywords: datasets

### ** Examples


data(pressureProfile)
ppp(pressureProfile[pressureProfile$filename=="F01",])

par(mfrow=c(1,1))
pps.data<-pps(pressureProfile, time=seq(1,140,by=5))
boxplot(Pc~time, data=pps.data, 
    xlab='time [in minutes]', ylab='Pc(psi)')

library(lattice)
pps.data<-pps(pressureProfile, time=seq(25,40,by=5))
xyplot(Pc ~ as.factor(file) | paste("time =", as.character(time), "minutes"),
    panel = function(x, y){
        m<-sum(y)/length(y)
        m5<-(max(y)-min(y))*0.05
        panel.abline(h=c(m-m5,m,m+m5), col=rep("#ffcccc",3),lwd=c(2,4,2))
        panel.grid(h=-1, v=0)
        panel.xyplot(x, y)
    },
    ylab='Pc [psi]',
    layout=c(1,4),
    sub='The three read lines indicate avg plus min 5%.',
    scales = list(x = list(rot = 45)),
    data=pps.data)




