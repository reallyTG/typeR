library(bootRes)


### Name: mdcc
### Title: Moving Response and Correlation Functions.
### Aliases: mdcc mdcc
### Keywords: models multivariate nonparametric robust

### ** Examples

data(muc.clim) # climatic data
data(muc.spruce) # spruce data

# calculate and plot moving response function
dc.mov1 <- mdcc(muc.spruce, muc.clim)
mdcplot(dc.mov1)

# calculate and plot moving correlation function with different window
# parameters

data(rt.spruce)
data(rt.temp)
data(rt.prec)

dc.mov2 <- mdcc(rt.spruce, list(rt.temp, rt.prec),
                vnames = c("temp", "prec"),
                method = "corr", win.size = 20,
win.offset = 5)
mdcplot(dc.mov2)



