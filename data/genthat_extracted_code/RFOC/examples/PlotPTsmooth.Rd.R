library(RFOC)


### Name: PlotPTsmooth
### Title: Plot Smooth PT-axes
### Aliases: PlotPTsmooth
### Keywords: hplot aplot

### ** Examples


plot(c(-1,1), c(-1,1), asp=1, type='n')

paz = rnorm(100, mean=297, sd=10)
 pdip = rnorm(100, mean=52, sd=8)

PlotPTsmooth(paz, pdip, x=0.5, y=.5, siz=.3, border=NA, bcol='white' ,
LABS=FALSE, add=FALSE, IMAGE=TRUE, CONT=FALSE)

taz = rnorm(100, mean=138, sd=10)
 tdip = rnorm(100, mean=12, sd=8)

 PlotPTsmooth(taz, tdip, x=-.5, y=.4, siz=.3, border=NA, bcol='white' ,
LABS=FALSE, add=FALSE, IMAGE=TRUE, CONT=TRUE)

###########  put them together
plot(c(-1,1), c(-1,1), asp=1, type='n')
PlotPTsmooth(paz, pdip, x=0, y=, siz=1, border=NA, bcol='white' ,
LABS=FALSE, add=FALSE, IMAGE=TRUE, CONT=FALSE)
PlotPTsmooth(taz, tdip, x=0, y=, siz=1, border=NA, bcol='white' ,
LABS=FALSE, add=TRUE, IMAGE=FALSE, CONT=TRUE)







