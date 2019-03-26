library(anchors)


### Name: chopit
### Title: Compound Hierarchical Ordered Probit (CHOPIT)
### Aliases: chopit
### Keywords: models

### ** Examples


##
data(mexchn)
fo <- list(self = xsayself ~ 1,
           vign = xsay3    ~ 1,
           tau  =           ~1 )
out1  <- chopit( fo, mexchn)
summary(out1)





