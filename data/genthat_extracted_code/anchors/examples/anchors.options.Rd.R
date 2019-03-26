library(anchors)


### Name: anchors.options
### Title: Set or query anchors() parameters
### Aliases: anchors.options
### Keywords: models

### ** Examples


data(mexchn)
fo <- list(self = xsayself ~ 1,
           vign = xsay3    ~ 1,
           tau  =           ~1 )
out1  <- chopit( fo, mexchn, options= anchors.options( vign.var = "hetero", normalize="hilo" ))
summary(out1)





