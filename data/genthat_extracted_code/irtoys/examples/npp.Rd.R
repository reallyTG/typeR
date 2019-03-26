library(irtoys)


### Name: npp
### Title: Non-parametric characteristic curves
### Aliases: npp
### Keywords: models

### ** Examples


# plot items 1:5 in different colours, label
npp(Scored, items=1:5, co=NA, label=TRUE)

# For item 7, compare npp with the 2PL parametric IRF 
npp(Scored, items=7, bands=TRUE)
plot(irf(ip=Scored2pl, items=7), co=3, add=TRUE)




