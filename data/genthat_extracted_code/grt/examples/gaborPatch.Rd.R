library(grt)


### Name: gaborPatch
### Title: Draw a gray-scale Gabor Patch
### Aliases: gaborPatch
### Keywords: misc

### ** Examples

# An imitation of Fredericksen et al.'s (1997) Fig 1.
# that demonstrate the relation between peak contrast
# and perceived size of the Gabor

op <- par(mfcol = c(3, 3), pty = "m", mai = c(0,0,0,0))
for(i in c(.85, .21, .06)){
    for(j in c(1/6, 1/7, 1/8)){
        gaborPatch(20, pc = i, sigma = j)
    }
}
par(op)

## Not run: 
##D # a typical plot of the stimuli and category structure
##D # often seen in artificial category-learning literatures.
##D m  <-  list(c(268, 157), c(332, 93))
##D covs  <-  matrix(c(4538, 4351, 4351, 4538), ncol = 2)
##D II <- grtrnorm(n = 40, np = 2, means = m, covs = covs,
##D    clip.sd = 4, seed = 1234)
##D II$sf <- .25+(II$x1/50)
##D II$theta <- II$x2*(18/50)
##D 
##D plot(II[,2:3], xlim = c(-100,600), ylim = c(-200,500), 
##D     pch = 21, bg = c("white","gray")[II$category])
##D abline(a = -175, b = 1)
##D 
##D library(Hmisc)
##D idx <- c(20, 31, 35, 49, 62)
##D xpos <- c(0, 100, 300, 350, 550)
##D ypos <- c(50, 300, 420, -120, 50)
##D for(i in 1:5)
##D {
##D     j = idx[i]
##D     segments(x0=II[j,"x1"], y0=II[j,"x2"], x1=xpos[i], y1=ypos[i])
##D     subplot(gaborPatch(sf=II[j,"sf"], theta=II[j,"theta"]), x=xpos[i], y=ypos[i])
##D }
## End(Not run)




