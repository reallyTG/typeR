library(BaM)


### Name: strikes
### Title: strikes
### Aliases: strikes

### ** Examples

n <- length(strikes)
r <- 1
s.y <- sum(strikes)

p.posterior.1000000 <- rbeta(1000000,n*r,s.y+0.5)
length(p.posterior.1000000[p.posterior.1000000<0.05])/1000000

par(mar=c(3,3,3,3))
ruler <- seq(0,1,length=1000)
beta.vals <- dbeta(ruler,n*r,s.y+0.5)
plot(ruler[1:200],beta.vals[1:200],yaxt="n",main="",ylab="",type="l")
mtext(side=2,line=1,"Density")
for (i in 1:length(ruler))
  if (ruler[i] < 0.05)
    segments(ruler[i],0,ruler[i],beta.vals[i])
segments(0.04,3,0.02,12.2)
text(0.02,12.8,"0.171")



