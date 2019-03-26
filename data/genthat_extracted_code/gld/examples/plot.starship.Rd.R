library(gld)


### Name: plot.starship
### Title: Plots to compare a fitted generalised lambda distribution to
###   data
### Aliases: plot.starship
### Keywords: distribution

### ** Examples

data <- rgl(100,0,1,.2,.2)
starship.result <- starship(data,optim.method="Nelder-Mead",initgrid=list(lcvect=(0:4)/10,
ldvect=(0:4)/10),return.data=TRUE)
plot(starship.result)



