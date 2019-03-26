library(MFDFA)


### Name: MFsim
### Title: Simulated multifractal series.
### Aliases: MFsim

### ** Examples



a<-0.9
N<-1024
tsx<-MFsim(N,a)

scale=10:100
q<--10:10
m<-1
b<-MFDFA(tsx, scale, m, q)
dev.new()
par(mai=rep(1, 4))
plot(q, b$Hq, col=1, axes= FALSE, ylab=expression('h'[q]), pch=16, cex.lab=1.8,
     cex.axis=1.8, main="q-order Hurst exponent", ylim=c(min(b$Hq),max(b$Hq)))
grid(col="midnightblue")
axis(1)
axis(2)




