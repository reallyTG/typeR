library(QuantPsyc)


### Name: proximal.med
### Title: Simple Mediation Models
### Aliases: proximal.med aroian.se.indirect2 goodman.se.indirect2
###   se.indirect2
### Keywords: models

### ** Examples


data(tra)
tmp.tra <- tra
names(tmp.tra) <- c('x','z','m','y')
data.frame(proximal.med(tmp.tra))  ## data.frame() simple makes the table 'pretty'





