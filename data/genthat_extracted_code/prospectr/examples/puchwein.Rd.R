library(prospectr)


### Name: puchwein
### Title: Puchwein algorithm for calibration sampling
### Aliases: puchwein

### ** Examples

data(NIRsoil)
sel <- puchwein(NIRsoil$spc,k=0.2,pc=.99)
plot(sel$pc[,1:2])
# points selected for calibration
points(NIRsoil$spc[sel$model,1:2],col=2,pch=2)
# Leverage plot
opar <- par(no.readonly=TRUE)
par(mar=c(4,5,2,2))
plot(sel$leverage$loop,sel$leverage$diff,type='l',
     xlab='# loops',ylab='Difference between theoretical and \n observed sum of leverages')
par(opar)



