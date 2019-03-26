library(network)


### Name: read.paj
### Title: Read a Pajek Project or Network File and Convert to an R
###   'Network' Object
### Aliases: read.paj read.paj.simplify switchArcDirection
###   readAndVectorizeLine
### Keywords: datasets

### ** Examples


require(network)

par(mfrow=c(2,2))

test.net.1 <- read.paj("http://vlado.fmf.uni-lj.si/pub/networks/data/GD/gd98/A98.net")
plot(test.net.1,main=test.net.1%n%'title')

test.net.2 <- read.paj("http://vlado.fmf.uni-lj.si/pub/networks/data/mix/USAir97.net")
# plot using coordinates from the file in the file
plot(test.net.2,main=test.net.2%n%'title',
               coord=cbind(test.net.2%v%'x',
               test.net.2%v%'y'),
               jitter=FALSE)
               
# read .paj project file
# notice output has $networks and $partitions
read.paj('http://vlado.fmf.uni-lj.si/vlado/podstat/AO/net/Tina.paj')




