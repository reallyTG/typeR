library(ecoval)


### Name: val.heavymetals.create
### Title: Creates a Value Function for River Heavy Metal Concentrations
### Aliases: val.heavymetals.create

### ** Examples

heavymetals <- val.heavymetals.create()
plot(heavymetals)
heavymetals.german <- val.heavymetals.create("Deutsch")
plot(heavymetals.german)
heavymetals.IKSR <- val.heavymetals.create(version="IKSR")
plot(heavymetals.IKSR,type="nodes")



