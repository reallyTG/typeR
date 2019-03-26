library(oce)


### Name: oceEdit
### Title: Edit an Oce Object
### Aliases: oceEdit oce.edit

### ** Examples


library(oce)
data(ctd)
ctd2 <- oceEdit(ctd, item="latitude", value=47.8879,
               reason="illustration", person="Dan Kelley")
ctd3 <- oceEdit(ctd,action="x@data$pressure<-x@data$pressure-1")



