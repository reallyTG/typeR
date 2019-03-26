library(bliss)


### Name: sim
### Title: sim
### Aliases: sim

### ** Examples

library(RColorBrewer)
param <- list(Q=2,n=25,p=c(50,50),grids_lim=list(c(0,1),c(-1,2)))
data <- sim(param)
data$y
cols <- colorRampPalette(brewer.pal(9,"YlOrRd"))(10)
q=2
par(mfrow=c(2,1))
matplot(data$grids[[q]],t(data$x[[q]]),type="l",lty=1,col=cols)
plot(data$grids[[q]],data$betas[[q]],type="l")
abline(h=0,lty=2,col="gray")
par(mfrow=c(1,1))



