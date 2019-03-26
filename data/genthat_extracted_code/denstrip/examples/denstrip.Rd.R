library(denstrip)


### Name: denstrip
### Title: Density strips
### Aliases: denstrip panel.denstrip
### Keywords: aplot color

### ** Examples

## Illustrate a known standard normal distribution
## Various settings to change the look of the plot

x <- seq(-4, 4, length=10000)
dens <- dnorm(x)
plot(x, xlim=c(-5, 5), ylim=c(-5, 5), xlab="x", ylab="x", type="n")
denstrip(x, dens, at=0) # default width 
denstrip(x, dens, width=0.5, at=0) 
denstrip(x, dens, at=-4, ticks=c(-2, 0, 2)) 
denstrip(x, dens, at=-3, ticks=c(-2, 2), mticks=0) 
denstrip(x, dens, at=-2, ticks=c(-2, 2), mticks=0, mlen=3, 
         mwd=4, colmax="#55AABB") 
denstrip(x, dens, at=1, ticks=c(-2, 2), tlen=3, twd=3) 
denstrip(x, dens, at=-4, ticks=c(-2, 2), mticks=0, colmax="darkgreen", 
         horiz=FALSE)
x <- rnorm(1000) # Estimate the density
denstrip(x, width=0.2, at=-3, ticks=c(-2, 2), mticks=0, colmax="darkgreen",
         horiz=FALSE)
denstrip(x, at=2, width=0.5, gamma=2.2) 
denstrip(x, at=3, width=0.5, gamma=1/2.2) 

### Specifying colour of minimum density 
par(bg="lightyellow")
plot(x, xlim=c(-5, 5), ylim=c(-5, 5), xlab="x", ylab="x", type="n")
x <- seq(-4, 4, length=10000)
dens <- dnorm(x)
## Equivalent ways of drawing same distribution 
denstrip(x, dens, at=-1, ticks=c(-2, 2), mticks=0, colmax="darkmagenta")
denstrip(x, dens, at=-2, ticks=c(-2, 2), mticks=0, colmax="darkmagenta",
         colmin="lightyellow")
## ...though the next only works if graphics device supports transparency 
denstrip(x, dens, at=-3, ticks=c(-2, 2), mticks=0, colmax="darkmagenta",
         colmin="transparent")
denstrip(x, dens, at=-4, ticks=c(-2, 2), mticks=0, colmax="#8B008B", colmin="white")

## Alternative to density regions (densregion.survfit) for
## survival curves - a series of vertical density strips with no
## interpolation

if (requireNamespace("survival", quietly=TRUE)){

library(survival)
fit <- survfit(Surv(time, status) ~ 1, data=aml, conf.type="log-log")
plot(fit, col=0)
lse <- (log(-log(fit$surv)) - log(-log(fit$upper)))/qnorm(0.975)
n <- length(fit$time)
lstrip <- fit$time - (fit$time-c(0,fit$time[1:(n-1)])) / 2
rstrip <- fit$time + (c(fit$time[2:n], fit$time[n])-fit$time) / 2
for (i in 1:n) { 
    y <- exp(-exp(qnorm(seq(0,1,length=1000)[-c(1,1000)], 
                        log(-log(fit$surv))[i], lse[i])))
    z <- dnorm(log(-log(y)), log(-log(fit$surv))[i], lse[i])
    denstrip(y, z, at=(lstrip[i]+rstrip[i])/2,
                 width=rstrip[i]-lstrip[i],
                 horiz=FALSE, colmax="darkred")
}
par(new=TRUE)
plot(fit, lwd=2)

}

## Use for lattice graphics (first example from help(xyplot))

library(lattice)
Depth <- equal.count(quakes$depth, number=8, overlap=.1)
xyplot(lat ~ long | Depth, data = quakes,
       panel = function(x, y) { 
           panel.xyplot(x, y)
           panel.denstrip(x, horiz=TRUE, at=-10, ticks=mean(x))
           panel.denstrip(y, horiz=FALSE, at=165, ticks=mean(y))
       } 
       )

## Lattice example data: heights of singing voice types

bwplot(voice.part ~ height, data=singer, xlab="Height (inches)",
       panel=panel.violin, xlim=c(50,80))
bwplot(voice.part ~ height, data=singer, xlab="Height (inches)",
       panel = function(x, y) {
           xlist <- split(x, factor(y))
           for (i in seq(along=xlist))
               panel.denstrip(x=xlist[[i]], at=i)
       },
       xlim=c(50,80)
       )



