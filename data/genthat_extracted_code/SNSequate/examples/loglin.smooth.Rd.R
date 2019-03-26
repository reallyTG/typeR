library(SNSequate)


### Name: loglin.smooth
### Title: Pre-smoothing using log-linear models.
### Aliases: loglin.smooth loglin.smooth.default
### Keywords: smoothing

### ** Examples

#Table 7.4 from Von Davier et al. (2004)
data(Math20EG)
rj<-loglin.smooth(scores=Math20EG[,1],degree=2,design="EG")$sp.est
sk<-loglin.smooth(scores=Math20EG[,2],degree=3,design="EG")$sp.est
score<-0:20
Table7.4<-cbind(score,rj,sk)
Table7.4

## Example taken from [1]
score <- 0:20
freq <- c(10, 2, 5, 8, 7, 9, 8, 7, 8, 5, 5, 4, 3, 0, 2, 0, 1, 0, 2, 1, 0)
ldata <- data.frame(score, freq)

plot(ldata, pch=16, main="Data w Lump at 0")
m1 = loglin.smooth(scores=ldata$freq,kert="gauss",degree=c(3),design="EG")
m2 = loglin.smooth(scores=ldata$freq,kert="gauss",degree=c(3),design="EG",lumpX=0)
Ns = sum(ldata$freq)
points(m1$sp.est*Ns, col=2, pch=16)
points(m2$sp.est*Ns, col=3, pch=16) # Preserves the lump



