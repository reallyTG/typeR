library(RFOC)


### Name: faultplane
### Title: fault plane projection on focal sphere
### Aliases: faultplane
### Keywords: aplot

### ** Examples



gcol='black'
border='black'
ndiv=36
phi = seq(0,2*pi, by=2*pi/ndiv);
  x = cos(phi);
  y = sin(phi);

plot(x,y, type='n', asp=1)
  lines(x,y, col=border)
  lines(c(-1,1), c(0,0), col=gcol)
  lines(c(0,0), c(-1,1), col=gcol)

faultplane(65, 34)





