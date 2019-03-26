library(Hmisc)


### Name: scat1d
### Title: One-Dimensional Scatter Diagram, Spike Histogram, or Density
### Aliases: scat1d jitter2 jitter2.default jitter2.data.frame datadensity
###   datadensity.data.frame histSpike histSpikeg
### Keywords: dplot aplot hplot distribution

### ** Examples

plot(x <- rnorm(50), y <- 3*x + rnorm(50)/2 )
scat1d(x)                 # density bars on top of graph
scat1d(y, 4)              # density bars at right
histSpike(x, add=TRUE)       # histogram instead, 100 bins
histSpike(y, 4, add=TRUE)
histSpike(x, type='density', add=TRUE)  # smooth density at bottom
histSpike(y, 4, type='density', add=TRUE)


smooth <- lowess(x, y)    # add nonparametric regression curve
lines(smooth)             # Note: plsmo() does this
scat1d(x, y=approx(smooth, xout=x)$y) # data density on curve
scat1d(x, curve=smooth)   # same effect as previous command
histSpike(x, curve=smooth, add=TRUE) # same as previous but with histogram
histSpike(x, curve=smooth, type='density', add=TRUE)  
# same but smooth density over curve


plot(x <- rnorm(250), y <- 3*x + rnorm(250)/2)
scat1d(x, tfrac=0)        # dots randomly spaced from axis
scat1d(y, 4, frac=-.03)   # bars outside axis
scat1d(y, 2, tfrac=.2)    # same bars with smaller random fraction


x <- c(0:3,rep(4,3),5,rep(7,10),9)
plot(x, jitter2(x))       # original versus jittered values
abline(0,1)               # unique values unjittered on abline
points(x+0.1, jitter2(x, limit=FALSE), col=2)
                          # allow locally maximum jittering
points(x+0.2, jitter2(x, fill=1), col=3); abline(h=seq(0.5,9,1), lty=2)
                          # fill 3/3 instead of 1/3
x <- rnorm(200,0,2)+1; y <- x^2
x2 <- round((x+rnorm(200))/2)*2
x3 <- round((x+rnorm(200))/4)*4
dfram <- data.frame(y,x,x2,x3)
plot(dfram$x2, dfram$y)   # jitter2 via scat1d
scat1d(dfram$x2, y=dfram$y, preserve=TRUE, col=2)
scat1d(dfram$x2, preserve=TRUE, frac=-0.02, col=2)
scat1d(dfram$y, 4, preserve=TRUE, frac=-0.02, col=2)


pairs(jitter2(dfram))     # pairs for jittered data.frame
# This gets reasonable pairwise scatter plots for all combinations of
# variables where
#
# - continuous variables (with unique values) are not jittered at all, thus
#   all relations between continuous variables are shown as they are,
#   extreme values have exact positions.
#
# - discrete variables get a reasonable amount of jittering, whether they
#   have 2, 3, 5, 10, 20 ... levels
#
# - different from adding noise, jitter2() will use the available space
#   optimally and no value will randomly mask another
#
# If you want a scatterplot with lowess smooths on the *exact* values and
# the point clouds shown jittered, you just need
#
pairs( dfram ,panel=function(x,y) { points(jitter2(x),jitter2(y))
                                    lines(lowess(x,y)) } )




datadensity(dfram)     # graphical snapshot of entire data frame
datadensity(dfram, group=cut2(dfram$x2,g=3))
                          # stratify points and frequencies by
                          # x2 tertiles and use 3 colors


# datadensity.data.frame(split(x, grouping.variable))
# need to explicitly invoke datadensity.data.frame when the
# first argument is a list

## Not run: 
##D require(rms)
##D f <- lrm(y ~ blood.pressure + sex * (age + rcs(cholesterol,4)),
##D          data=d)
##D p <- Predict(f, cholesterol, sex)
##D g <- ggplot(p, aes(x=cholesterol, y=yhat, color=sex)) + geom_line() +
##D   xlab(xl2) + ylim(-1, 1)
##D g <- g + geom_ribbon(data=p, aes(ymin=lower, ymax=upper), alpha=0.2,
##D                 linetype=0, show_guide=FALSE)
##D g + histSpikeg(yhat ~ cholesterol + sex, p, d)
##D 
##D # colors <- c('red', 'blue')
##D # p <- plot_ly(x=x, y=y, color=g, colors=colors, mode='markers')
##D # histSpikep(p, x, y, z, color=g, colors=colors)
## End(Not run)



