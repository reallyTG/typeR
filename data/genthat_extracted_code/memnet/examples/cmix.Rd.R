library(memnet)


### Name: cmix
### Title: Fast general purpose color mixer
### Aliases: cmix

### ** Examples


# mix blue and red with more weight on blue
cmix('blue', 'red', .2)

# mix blue and red with more weight on red
cmix('blue', 'red', .8)

# mix blue and red and return as rgb
cmix('blue', 'red', .8, format = 'rgb')




