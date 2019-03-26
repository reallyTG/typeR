library(seismicRoll)


### Name: roll_mean
### Title: Rolling Mean with Alignment
### Aliases: roll_mean

### ** Examples

x <- rep(1:5,each=10)
plot(x,cex=0.8,pch=17,main="Test of roll_mean alignment with a 5-point window")
points(roll_mean(x,5,1,'left'),cex=1.5,col='blue',type='b')
points(roll_mean(x,5,1,'center'),cex=1.5,col='forestgreen',type='b')
points(roll_mean(x,5,1,'right'),cex=1.5,col='red',type='b')
legend("topleft",
       legend=c('data','align=left','align=center','align=right'),
       col=c('black','blue','forestgreen','red'),
       pch=c(17,1,1,1))



