library(popbio)


### Name: sensitivity
### Title: Sensitivity analysis of a projection matrix
### Aliases: sensitivity
### Keywords: survey

### ** Examples

data(teasel)

sens<-sensitivity(teasel)
## IMAGE plot with smaller boxes 
image2(sens, mar=c(1,3.5,5,1), box.offset=.1)
 title("Sensitivity matrix using image2", line=2.5)
## MATPLOT
matplot2(sens, log='y', type='b', yaxt='n', ltitle="Fate",
ylab=expression(paste("Sensitivity of ",lambda)), 
main="Sensitivity matrix using matplot2")
pwrs<- -4:1
axis(2, 10^pwrs, parse(text=paste("10^", pwrs, sep = "")), las=1)






