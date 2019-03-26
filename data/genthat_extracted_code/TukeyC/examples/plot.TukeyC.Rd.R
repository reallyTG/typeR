library(TukeyC)


### Name: plot.TukeyC
### Title: Plot TukeyC and TukeyC.nest Objects
### Aliases: plot.TukeyC
### Keywords: package

### ** Examples

##
## Examples: Completely Randomized Design (CRD)
## More details: demo(package='TukeyC')
##

library(TukeyC)
data(CRD2)

## From: formula
tk1 <- with(CRD2,
            TukeyC(y ~ x,
                   data=dfm,
                   which='x'))

old.par <- par(mar=c(6, 3, 6, 2))
plot(tk1,
     id.las=2)

plot(tk1,
     dispersion='sd',
     mm.lty=3,
     id.las=2,
     yl=FALSE)

## From: aov
av <- with(CRD2,
           aov(y ~ x,
               data=dfm))
summary(av)

tk2 <- TukeyC(x=av,
              which='x')
plot(tk2,
     yl=FALSE,
     id.las=2)

# From: lm
av_lm <- with(CRD2,
           lm(y ~ x,
              data=dfm))

tk3 <- TukeyC(x=av_lm,
              which='x')
plot(tk3,
     dispersion='ci',
     id.las=2,
     yl=FALSE)

plot(tk3,
     dispersion='cip',
     id.las=2,
     yl=FALSE)


par(old.par)



