library(RFOC)


### Name: fancyarrows
### Title: Make fancy arrows
### Aliases: fancyarrows
### Keywords: aplot

### ** Examples

   thick = 0.01; headlength = 0.2; headthick = 0.1

x = runif(10, -1, 1)
y = runif(10, -1, 1)

############   MUST set asp=1 here
plot(x,y, asp=1)

fancyarrows(rep(0, 10) , rep(0, 10) ,x, y,
thick =thick , headlength =  headlength,
headthick =headthick)




