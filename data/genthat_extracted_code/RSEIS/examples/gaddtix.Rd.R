library(RSEIS)


### Name: gaddtix
### Title: add tic marks
### Aliases: gaddtix
### Keywords: misc aplot

### ** Examples



plot(c(0,1), c(0,1), type='n', ann=FALSE, axes=FALSE)

gaddtix(side=1, pos=0,   tck=-0.01, at=seq(from=0, to=.5, by=.2) ,
labels=seq(from=0, to=.5, by=.2), col=1)




