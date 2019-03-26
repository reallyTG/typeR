library(mrgsolve)


### Name: as_deslist
### Title: Create a list of designs from a data frame
### Aliases: as_deslist

### ** Examples

idata <- dplyr::data_frame(ID=1:4, end=seq(24,96,24), delta=6,
add=list(c(122,124,135),c(111), c(99),c(88)))

idata <- dplyr::mutate(idata, GRP = ID %%2)

idata

l <- as_deslist(idata,"GRP")

l

lapply(l,stime)

lapply(as_deslist(idata, "ID"),stime)




