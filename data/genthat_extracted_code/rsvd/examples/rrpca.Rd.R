library(rsvd)


### Name: rrpca
### Title: Randomized robust principal component analysis (rrpca).
### Aliases: rrpca

### ** Examples

library('rsvd')

# Create toy video
# background frame
xy <- seq(-50, 50, length.out=100)
mgrid <- list( x=outer(xy*0,xy,FUN="+"), y=outer(xy,xy*0,FUN="+") )
bg <- 0.1*exp(sin(-mgrid$x**2-mgrid$y**2))
toyVideo <- matrix(rep(c(bg), 100), 100*100, 100)

# add moving object
for(i in 1:90) {
  mobject <- matrix(0, 100, 100)
  mobject[i:(10+i), 45:55] <- 0.2
  toyVideo[,i] =  toyVideo[,i] + c( mobject )
}

# Foreground/Background separation
out <- rrpca(toyVideo, trace=TRUE)

# Display results of the seperation for the 10th frame
par(mfrow=c(1,4))
image(matrix(bg, ncol=100, nrow=100)) #true background
image(matrix(toyVideo[,10], ncol=100, nrow=100)) # frame
image(matrix(out$L[,10], ncol=100, nrow=100)) # seperated background
image(matrix(out$S[,10], ncol=100, nrow=100)) #seperated foreground



