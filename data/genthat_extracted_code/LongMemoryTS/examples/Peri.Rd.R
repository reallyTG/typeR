library(LongMemoryTS)


### Name: Peri
### Title: Multivariate Periodogram.
### Aliases: Peri

### ** Examples

series<-FI.sim(T=1000,q=2,rho=0.7,d=c(0.4,0.4))
peri<-Peri(series)
par(mfrow=c(2,2))
for(i in 1:2){
for(j in 1:2){
plot(Re(peri[i,j,]), type="h")
lines(Im(peri[i,j,]), col=2)
}}



