library(ScottKnott)


### Name: plot.SK
### Title: Plot SK and SK.nest Objects
### Aliases: plot.SK
### Keywords: package htest univar tree design

### ** Examples

##
## Examples: Completely Randomized Design (CRD)
## More details: demo(package='ScottKnott')
##

library(ScottKnott)
data(CRD2)

## From: vectors x and y
sk1 <- with(CRD2,
            SK(x=x,
               y=y,
               model='y ~ x',
               which='x'))

plot(sk1,
     id.las=2,
     rl=FALSE, 
     title='Factor levels')

## From: design matrix (dm) and response variable (y)
sk2 <- with(CRD2,
            SK(x=dm,
               y=y,
               model='y ~ x',
               which='x'))
plot(sk2,
     col=rainbow(max(sk2$groups)),
     mm.lty=3,
     id.las=2,
     rl=FALSE,
     title='Factor levels')

## From: data.frame (dfm)
sk3 <- with(CRD2,
            SK(x=dfm,
               model='y ~ x',
               which='x'))

plot(sk3,
     col=rainbow(max(sk3$groups)),
     id.las=2,
     id.col=FALSE,
     rl=FALSE)

## From: aov
av <- with(CRD2,
           aov(y ~ x,
               data=dfm))
summary(av)

sk4 <- with(CRD2,
            SK(x=av,
               which='x'))

plot(sk4,
     col=rainbow(max(sk4$groups)),
     rl=FALSE,
     id.las=2,
     id.col=FALSE,
     title=NULL)



