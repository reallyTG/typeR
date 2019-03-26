library(protViz)


### Name: fetuinLFQ
### Title: fetuinLFQ - A data set for evaluation of relative and absolute
###   label-free quantification methods.
### Aliases: fetuinLFQ apex empai t3pq
### Keywords: datasets

### ** Examples


library(lattice)
data(fetuinLFQ)

cv<-1-1:7/10
t<-trellis.par.get("strip.background")
t$col<-(rgb(cv,cv,cv))
trellis.par.set("strip.background",t)

my.xlab="Fetuin concentration spiked into experiment [fmol]"
my.ylab<-"Abundance"

xyplot(abundance~conc|prot*method, 
    data=fetuinLFQ$apex, 
    groups=prot,
    aspect=1,
    panel = function(x, y, subscripts, groups) {
        if (groups[subscripts][1] == "Fetuin")  {
            panel.fill(col="#ffcccc")
        }
                panel.grid(h=-1,v=-1)
                panel.xyplot(x, y)
                panel.loess(x,y, span=1)
            },
    xlab=my.xlab,
    ylab=my.ylab
)


xyplot(abundance~conc|prot*method,
    data=fetuinLFQ$empai,
    groups=prot,
    aspect=1,
    panel = function(x, y, subscripts, groups) {
        if (groups[subscripts][1] == "Fetuin")  {
            panel.fill(col="#ffcccc")
        }
                panel.grid(h=-1,v=-1)
                panel.xyplot(x, y)
                panel.loess(x,y, span=1)
            },
    xlab=my.xlab,
    ylab=my.ylab
)


xyplot(abundance~conc|prot*method,
    data=fetuinLFQ$t3pq,
    groups=prot,
    aspect=1,
    panel = function(x, y, subscripts, groups) {
        if (groups[subscripts][1] == "Fetuin")  {
            panel.fill(col="#ffcccc")
        }
                panel.grid(h=-1,v=-1)
                panel.xyplot(x, y)
                panel.loess(x,y, span=1)
        if (groups[subscripts][1] == "Fetuin")  {
            panel.text(min(fetuinLFQ$t3pq$conc),
                max(fetuinLFQ$t3pq$abundance),
                paste("R-squared:", 
                round(summary(lm(x~y))$r.squared,2)),
                cex=0.75,
                pos=4)
        }
            },
    xlab=my.xlab,
    ylab=my.ylab
)





