library(FlowScreen)


### Name: screen.frames
### Title: Plot one or more frames from the summary screening plot
### Aliases: screen.frames

### ** Examples

# load results from metrics.all function for the Caniapiscau River
data(caniapiscau.res)
caniapiscau.ts <- caniapiscau.res$indata

# plot one frame from the baseflow screening plot
screen.frames(caniapiscau.res, type="b", element=1)

# plot three frames from the low flow screening plot
screen.frames(caniapiscau.res, type="l", element=c(1:3))

# create a custom summary plot
opar <- par(no.readonly = TRUE)
layout(matrix(c(1,2,3,4), 2, 2, byrow=TRUE))
par(oma=c(0,0,3,0))
stninfo <- station.info(caniapiscau.ts, Plot=TRUE)
screen.frames(caniapiscau.res, type="h", element=1, text=NULL, multi=TRUE)
screen.frames(caniapiscau.res, type="l", element=1, text=NULL, multi=TRUE)
screen.frames(caniapiscau.res, type="b", element=1, text=NULL, multi=TRUE)
mtext(paste("Station ID: ", caniapiscau.ts[1,1], ", Agency: WSC, Country: CA", sep=""),
side=3, line=1, outer=TRUE, cex=0.9)
par <- opar
layout(1,1,1)

# or plot everything!
opar <- par(no.readonly = TRUE)
layout(matrix(c(1:30), 5, 6, byrow=TRUE))
screen.frames(caniapiscau.res, type="h", text=NULL, multi=TRUE)
screen.frames(caniapiscau.res, type="l", text=NULL, multi=TRUE)
screen.frames(caniapiscau.res, type="b", text=NULL, multi=TRUE)
par <- opar
layout(1,1,1)



