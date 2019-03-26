library(popbio)


### Name: stage.vector.plot
### Title: Plot stage vector projections
### Aliases: stage.vector.plot
### Keywords: survey

### ** Examples


## matrix from Example 2.1 in Caswell
A<-matrix(c(
0, 0.3,   0,
1,   0, 0.5,
5,   0,   0
), nrow=3, dimnames=list(1:3,1:3))
n<-c(1,0,0)
p<-pop.projection(A,n,60)

## Plots in Figure 2.3
stage.vector.plot(p$stage.vector[,1:15], col='black', las=1, prop=FALSE)
stage.vector.plot(p$stage.vector[,1:40], col=2:4, las=1)
## log-scale with custom y-axis
stage.vector.plot(p$stage.vector, col=2:4, prop=FALSE,
ylim=c(.01, 10), log='y', legend="bottomright", yaxt='n')
pwrs<- -2:1
# major ticks
axis(2, at = 10^pwrs, labels=parse(text=paste("10^", pwrs, sep = "")),
las=1, tcl= -.6)
# minor ticks
axis(2, at = 1:9 * rep(10^pwrs[-1] / 10, each = 9),
    tcl = -0.3, labels = FALSE)




