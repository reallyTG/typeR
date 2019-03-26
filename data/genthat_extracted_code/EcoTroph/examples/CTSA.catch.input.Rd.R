library(EcoTroph)


### Name: CTSA.catch.input
### Title: Catch input for CTSA
### Aliases: CTSA.catch.input
### Keywords: ~EcoTroph ~CTSA

### ** Examples

data(ecopath_guinee)
catch.group=ecopath_guinee[,c("group_name","TL","catch.1","catch.2")]
Y_test <- CTSA.catch.input(catch.group)
Y_test



