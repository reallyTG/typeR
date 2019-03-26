library(ecespa)


### Name: haz.ppp
### Title: Easily convert xy data to ppp format
### Aliases: haz.ppp
### Keywords: spatial

### ** Examples



data(fig1)

plot(fig1) #typical xyplot

fig1.ppp <- haz.ppp (fig1)

fig1.ppp

plot(fig1.ppp) # point pattern plot of spatstat





