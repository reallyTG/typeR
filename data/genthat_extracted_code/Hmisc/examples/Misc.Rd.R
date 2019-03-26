library(Hmisc)


### Name: Misc
### Title: Miscellaneous Functions
### Aliases: clowess confbar getLatestSource grType prType htmlSpecialType
###   inverseFunction james.stein km.quick latexBuild lm.fit.qr.bare matxv
###   makeSteps nomiss outerText plotlyParm sepUnitsTrans strgraphwrap
###   tobase64image trap.rule trellis.strip.blank unPaste whichClosest
###   whichClosePW whichClosek xless
### Keywords: programming utilities iplot

### ** Examples



trap.rule(1:100,1:100)

unPaste(c('a;b or c','ab;d','qr;s'), ';')

sepUnitsTrans(c('3 days','4 months','2 years','7'))

set.seed(1)
whichClosest(1:100, 3:5)
whichClosest(1:100, rep(3,20))

whichClosePW(1:100, rep(3,20))
whichClosePW(1:100, rep(3,20), f=.05)
whichClosePW(1:100, rep(3,20), f=1e-10)

x <- seq(-1, 1, by=.01)
y <- x^2
h <- inverseFunction(x,y)
formals(h)$turns   # vertex
a <- seq(0, 1, by=.01)
plot(0, 0, type='n', xlim=c(-.5,1.5))
lines(a, h(a)[,1])            ## first inverse
lines(a, h(a)[,2], col='red') ## second inverse
a <- c(-.1, 1.01, 1.1, 1.2)
points(a, h(a)[,1])

## Not run: 
##D getLatestSource(recent=5)  # source() most recent 5 revised files in Hmisc
##D getLatestSource('cut2')    # fetch and source latest cut2.s
##D getLatestSource('all')     # get everything
##D getLatestSource(avail=TRUE) # list available files and latest versions
## End(Not run)



