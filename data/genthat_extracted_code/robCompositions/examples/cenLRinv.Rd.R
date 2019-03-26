library(robCompositions)


### Name: cenLRinv
### Title: Inverse centred log-ratio transformation
### Aliases: cenLRinv
### Keywords: manip

### ** Examples


data(expenditures)
eclr <- cenLR(expenditures, 2)
inveclr <- cenLRinv(eclr)
head(expenditures)
head(inveclr)
head(cenLRinv(eclr$x.clr))




