library(ecoval)


### Name: ecoval-package
### Title: Procedures for the Ecological Assessment of Surface Waters
### Aliases: ecoval-package ecoval
### Keywords: package

### ** Examples

# creation of individual modules:

morphol <- msk.morphol.1998.create()
plot(morphol)

hydrol <- msk.hydrol.2011.create()
plot(hydrol)

physapp <- msk.physapp.2007.create()
plot(physapp)

nutrients <- msk.nutrients.2010.create()
plot(nutrients)

micropoll <- val.micropoll.create()
plot(micropoll)

heavymetals <- val.heavymetals.create()
plot(heavymetals)

spear <- val.spear.create()
plot(spear)

diatoms <- msk.diatoms.2007.create()
plot(diatoms)

invertebrates <- msk.invertebrates.2010.create()
plot(invertebrates)

fish <- msk.fish.2004.create()
plot(fish)

# creation of three versions of assessment programs:

msk <- msk.create(language="EnglishNodes",col="blue")
plot(msk)
plot(msk,with.attrib=FALSE)

ecoval <- ecoval.river.create(language="EnglishNodes",col="red")
plot(ecoval)
plot(ecoval,with.attrib=FALSE)

beetles_richness <- utility.endnode.parfun1d.create(name.node   = "richness", 
                                                    name.attrib = "gb_richness", 
                                                    range       = c(0,1), 
                                                    name.fun    = "utility.fun.exp", 
                                                    par         = c(2,0,1), 
                                                    utility     = FALSE)
beetles_concordance <- utility.endnode.parfun1d.create(name.node   = "concordance", 
                                                       name.attrib = "gb_concordance", 
                                                       range       = c(0,1), 
                                                       name.fun    = "utility.fun.exp", 
                                                       par         = c(1,0,1), 
                                                       utility     = FALSE)
beetles <-utility.aggregation.create(name.node = "ground beetles",
                                     nodes     = list(beetles_richness,beetles_concordance),
                                     name.fun  = "utility.aggregate.add",
                                     par       = c(0.5,0.5))

ecoval2 <- ecoval.river.create(phys     = list(msk.morphol.1998.create),
                               chem     = list(msk.nutrients.2010.create,
                                               val.pesticides.create,
                                               val.heavymetals.create),
                               biol     = list(msk.invertebrates.2010.create,
                                               msk.fish.2004.create,
                                               beetles),
                               language = "EnglishNodes")
plot(ecoval2)
plot(ecoval2,with.attrib=FALSE)



