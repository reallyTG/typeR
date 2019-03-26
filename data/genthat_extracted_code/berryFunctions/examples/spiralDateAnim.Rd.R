library(berryFunctions)


### Name: spiralDateAnim
### Title: Animated spiral graph
### Aliases: spiralDateAnim
### Keywords: aplot chron color hplot

### ** Examples


set.seed(42)
x <- as.Date("1985-01-01")+0:5000
y <- cumsum(rnorm(5001))+50
y <- y + sin(0:5000/366*2*pi)*max(abs(y))/2
plot(x,y)

spiralDateAnim(x,y, steps=10, sleep=0.01) # 0.05 might be smoother...
spiralDateAnim(x,y, steps=20)

## Not run: 
##D ## Rcmd check --as-cran doesn't like to open external devices such as pdf,
##D ## so this example is excluded from running in the checks.
##D pdf("spiralDateAnimation.pdf")
##D spiralDateAnim(x,y, main="Example Transition", col=divPal(100), format=" ")
##D dev.off()
##D 
##D # if you have FFmpeg installed, you can use the animation package like this:
##D library2(animation)
##D saveVideo(spiralDateAnim(x,y, steps=300), video.name="spiral_anim.mp4", interval=0.1,
##D     ffmpeg="C:/Program Files/R/ffmpeg/bin/ffmpeg.exe")
##D 
## End(Not run)




