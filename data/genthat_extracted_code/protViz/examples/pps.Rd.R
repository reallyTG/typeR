library(protViz)


### Name: pressureProfileSummary
### Title: A misc function for finding NN time slots in pressure profile
###   data.
### Aliases: pressureProfileSummary pps

### ** Examples


library(lattice)
data(pressureProfile)

# do the pre processing
pps.data<-pps(pressureProfile, time=seq(25,40,by=5))

print(xyplot(Pc ~ as.factor(file) | paste("time =", 
    as.character(time), "minutes"),
    panel = function(x, y){
        m<-sum(y)/length(y)
        m5<-(max(y)-min(y))*0.05
        panel.abline(h=c(m-m5,m,m+m5), 
            col=rep("#ffcccc",3),lwd=c(1,2,1))
        panel.grid(h=-1, v=0)
        panel.xyplot(x, y)
    },
    ylab='Pc [psi]',
    layout=c(1,4),
    sub='The three read lines indicate avg plus min 5%.',
    scales = list(x = list(rot = 45)),
    data=pps.data))




