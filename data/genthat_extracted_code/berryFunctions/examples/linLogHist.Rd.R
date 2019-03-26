library(berryFunctions)


### Name: linLogHist
### Title: lin-log transition histogram
### Aliases: linLogHist
### Keywords: dplot dynamic hplot

### ** Examples


x <- rlnorm(700, m=3)
hist(x, col=4)
hist(log10(x), xaxt="n"); logAxis(1); hist(log10(x), col=4, add=TRUE)

op <- par()
linLogHist(x, steps=8, sleep=0.01) # 0.05 might be smoother

linLogHist(x, xlab="ddd", breaks=30, steps=3, write_t=FALSE, yaxt="n", freq=FALSE,
   main="", parexpr='par(mar=c(2,0.5,1.5,0.5), mgp=c(1.8,1,0))',
   endexpr='mtext("Probability Density", line=-1.2, adj=0.03, outer=T)')
par(op)

## Not run: 
##D ## Rcmd check --as-cran doesn't like to open external devices such as pdf,
##D ## so this example is excluded from running in the checks.
##D pdf("LinLogTransitionAnimation.pdf")
##D linLogHist(x, main="Example Transition", steps=20, freq=FALSE)
##D dev.off()
##D 
##D # if you have FFmpeg installed, you can use the animation package like this:
##D library2(animation)
##D saveVideo(linLogHist(x, steps=50), video.name="linlog_anim.mp4", interval=0.08,
##D ffmpeg="C:/ffmpeg-20150424-git-cd69c0e-win64-static/bin/ffmpeg.exe")
## End(Not run)




