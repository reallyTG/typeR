library(multicon)


### Name: structSumIPC
### Title: Structural Summary Method for the Interpersonal Circumplex
### Aliases: structSumIPC
### Keywords: IPC Structural Summary

### ** Examples

  # How is the CAQ associated with the IPC?
data(caq) # Load the caq data
data(beh.comp) #Load Behavioral composite data 
data(caq.items) #Load CAQ items 
  # Get IPC octant scores from the behavioral composites of the RBQ.
PA <- composite(beh.comp[,c(56, 4, 5)])
BC <- composite(beh.comp[,c(17, 27, 54)])
DE <- composite(beh.comp[,c(60, 19, 34)])
FG <- composite(beh.comp[,c(13, 22, 36)])
HI <- composite(beh.comp[,c(50, 21, 26)])
JK <- composite(beh.comp[,c(3, 18, 29)])
LM <- composite(beh.comp[,c(7, 32, 28)])
NO <- composite(beh.comp[,c(15, 20, 62)])
IPC.set <- data.frame(PA,BC,DE,FG,HI,JK,LM,NO) # Put them into one data.frame
  # Get the correlations between the CAQ and the IPC
r <- cor(caq, IPC.set)
  # Apply the structural summary method to the correlations
CAQsum <- structSumIPC(r)
CAQsum$items <- caq.items
CAQsum
  # Plot the results (only those with Rsq >= .70)
CAQsum.sig <- data.frame(CAQsum[CAQsum$Rsq >= .7,], row.names=1:51)
plotDEGcaq <- CAQsum.sig$DEG
CAQx <- cos(plotDEGcaq * (pi / 180))
CAQy <- sin(plotDEGcaq * (pi / 180))
plotPOScaq <- ifelse(plotDEGcaq > 90 & plotDEGcaq < 270, 2, 4)
plotDEGcaq <- ifelse(plotDEGcaq > 90 & plotDEGcaq < 270, plotDEGcaq + 180, plotDEGcaq)

plot(CAQx, CAQy, xlim=c(-2, 2), ylim=c(-2, 2), type="n", xlab="Warmth", 
	ylab="Dominance", font.main=1, main="CAQ and the IPC", xaxt="n", yaxt="n")
for(i in 1:51) {
  text(CAQx[i], CAQy[i], labels=CAQsum.sig$items[i,1], cex=.75, 
  srt=plotDEGcaq[i], pos=plotPOScaq[i])
}
  # Adding a circle
circX <- seq(-1,1, by=.01)
circY <- sqrt(1 - circX^2)
lines(c(circX,-circX), c(circY,-circY))
lines(c(0,0), c(-1,1))
lines(c(-1,1), c(0,0))



