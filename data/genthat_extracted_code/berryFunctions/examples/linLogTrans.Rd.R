library(berryFunctions)


### Name: linLogTrans
### Title: Animation for transition from linear to logarithmic axis
### Aliases: linLogTrans
### Keywords: dplot dynamic hplot

### ** Examples


set.seed(42);  x <- 10^rnorm(100, 3);  y <- runif(100)
linLogTrans(x,y, steps=15, sleep=0.01) # 0.05 might be smoother...
linLogTrans(x,y, steps=15, log="y", ylim=c(0.1, 0.8), base=c(1,2,5))

## Not run: 
##D ## Rcmd check --as-cran doesn't like to open external devices such as pdf,
##D ## so this example is excluded from running in the checks.
##D pdf("LinLogTransitionAnimation.pdf")
##D linLogTrans(x,y, main="Example Transition")
##D dev.off()
##D 
##D # if you have FFmpeg installed, you can use the animation package like this:
##D library2(animation)
##D saveVideo(linLogTrans(x,y, steps=300), video.name="linlog_anim.mp4", interval=0.01,
##D     ffmpeg="C:/ffmpeg-20150424-git-cd69c0e-win64-static/bin/ffmpeg.exe")
##D 
##D 
##D # old t values were dependent on the value of steps
##D findt <- function(steps) {
##D   # t-values for x^(1/t):
##D   allt <- 10^(seq(0,2.5,len=1e4) )
##D   # selection at upper half of these values;
##D   # Otherwise, the animation slows down too much at the end
##D   f <- 1.4 # multiplication factor due to length loss by unique
##D   sel <- round(seq(1, 10, len=f*steps)^4)   #0.5*seq(1, 100, len=1.3*steps)^2 + 0.5*
##D   sel2 <- unique(round(log10(seq(1, 10, len=f*steps))*f*steps))
##D   sel2[1] <- 1
##D   sel <- sel[sel2]
##D   # final t-values for transition:
##D   allt <- unique(round(allt[sel], 2))
##D   data.frame(x=seq(1,1000,len=length(allt)), t=allt)
##D   }
##D 
##D plot(findt(1000), type="l", log="y", las=1)
##D for(i in 5:999) lines(findt(i), col=rainbow2(1000)[i])
##D d <- findt(300)
##D lines(d) # good average
##D 
##D plot(d$x[-1], diff(d$t), type="l", ylim=c(3e-3,10), yaxt="n", log="y", main="t value growth rate")
##D logAxis(2) ; lines(d$x[-1], diff(d$t))
##D d2 <- findt(1000)
##D lines(d2$x[-1], diff(d2$t), col=2)
##D lines(2:1000, diff(linLogTrans(1,1, steps=1000, plot=F)), col=4)
##D 
##D 
##D d <- findt(300)
##D pdf("degreepoly.pdf")
##D for(i in 5:30)
##D   {
##D   plot(d, log="y", type="l", lwd=3, main=i, xlim=c(0,300), ylim=c(1,2))
##D   modell <- lm(t ~  poly(x,i, raw=T), data=d)
##D   lines(x2, predict(modell, data.frame(x=1:1300)), col=2)
##D   }
##D dev.off()   # 17 is good
##D 
##D cf <- coef(lm(t ~  poly(x,17, raw=T), data=d)) # these are currently used in the function
##D x <- 1:1000
##D y <- rowSums(sapply(1:18, function(i) cf[i]*x^(i-1)), na.rm=TRUE)
##D lines(x, y, lwd=3)
##D y[1] <- 1
##D plot(x, round(y, 3), ylim=c(1,3), xlim=c(0,500), type="l", log="")
##D dput(round(y, 3))
##D 
##D findn <- function(steps) nrow(findt(steps))
##D plot(1:1000, sapply(1:1000, findn), type="l")
##D abline(b=1, a=0)
##D 
## End(Not run)




