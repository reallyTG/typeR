library(oce)


### Name: as.section
### Title: Create a Section
### Aliases: as.section

### ** Examples

library(oce)
data(ctd)
## vector of names of CTD objects
fake <- ctd
fake[["temperature"]] <- ctd[["temperature"]] + 0.5
fake[["salinity"]] <- ctd[["salinity"]] + 0.1
fake[["longitude"]] <- ctd[["longitude"]] + 0.01
fake[["station"]] <- "fake"
sec1 <- as.section(c("ctd", "fake"))
summary(sec1)
## vector of CTD objects
ctds <- vector("list", 2)
ctds[[1]] <- ctd
ctds[[2]] <- fake
sec2 <- as.section(ctds)
summary(sec2)
## argo data (a subset)
data(argo)
sec3 <- as.section(subset(argo, profile<5))
summary(sec3)




