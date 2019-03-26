library(bootRes)


### Name: dcc
### Title: Response and correlation functions.
### Aliases: dendroclim dcc
### Keywords: models multivariate nonparametric robust

### ** Examples

## No test: 
data(muc.clim) # climatic data
data(muc.spruce) # spruce data

# calculate and plot response function
dc.resp <- dcc(muc.spruce, muc.clim)
dcplot(dc.resp)

# calculate and plot correlation function
dc.corr <- dcc(muc.spruce, muc.clim, method = "corr")
dcplot(dc.corr)

# use modelled data for better response ;-)
data(muc.fake)
dc.resp.fake <- dcc(muc.fake, muc.clim)
dcplot(dc.resp.fake)

# use DENDROCLIM2002-style data
data(rt.spruce)
data(rt.temp)
data(rt.prec)
dc.resp <- dcc(rt.spruce, list(rt.temp, rt.prec), vnames =
c("Temperature", "Precipitation"))
dcplot(dc.resp)
## End(No test)



