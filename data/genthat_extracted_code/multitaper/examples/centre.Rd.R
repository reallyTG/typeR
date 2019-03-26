library(multitaper)


### Name: centre
### Title: Centres (converts to zero-mean) the time series.
### Aliases: centre
### Keywords: math

### ** Examples

data(willamette)
cent.Slepian <- centre(willamette, nw=4, k=8, deltaT=1)
cent.Trim <- centre(willamette, trim=0.2)



