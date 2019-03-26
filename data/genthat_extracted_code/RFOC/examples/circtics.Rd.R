library(RFOC)


### Name: circtics
### Title: Draw circular ticmarks
### Aliases: circtics
### Keywords: aplot

### ** Examples


 phi = seq(from =0, to = 2 * pi, length=360)
    x = cos(phi)
    y = sin(phi)
    plot(x, y, col = 'blue', asp=1, type='l')
   circtics(r = 1, dr = 0.02, dang = 10, col='red')







