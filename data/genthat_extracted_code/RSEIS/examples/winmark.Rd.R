library(RSEIS)


### Name: winmark
### Title: Window Mark
### Aliases: winmark
### Keywords: aplot

### ** Examples


plot(c(0,1), c(0,1), type='n', xlab='', ylab='' )


winmark(.3, .7,       side=3, col='brown', arrows=TRUE, leglen=.4)
winmark(.3, .7,       side=1, col='blue', arrows=TRUE, leglen=.5)

winmark(.3, .7,        side=2, col='green',
arrows=TRUE, alen=.05, leglen=.4)


winmark(.3, .7,      leg=.65, bar=.6,
side=4, col='orange', arrows=TRUE, alen=.1, leglen=.125)


winmark(.3, .7,      bar=.65, leg=.6,
side=4, col='seagreen', arrows=TRUE, alen=.1, leglen=.125)
#############  examples with different legs showing
plot(c(0,1), c(0,1), type='n', xlab='', ylab='' )

winmark(.3, .7,       side=3, col='brown',
arrows=TRUE, leglen=.4, LEGON=1)
winmark(.3, .4,       side=1, col='brown',
 arrows=TRUE, leglen=.4, LEGON=2)
winmark(.7, .9,       side=1, col='blue',
arrows=TRUE, leglen=.4, LEGON=0)





