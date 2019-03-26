library(traitdataform)


### Name: mutate.traitdata
### Title: Mutate traits within a traitdata object.
### Aliases: mutate.traitdata

### ** Examples


## Not run: 
##D pulldata("arthropodtraits")
##D dataset3 <- as.traitdata(arthropodtraits,
##D                          taxa = "SpeciesID",
##D                          traits = c("Body_Size", "Dispersal_ability",
##D                             "Feeding_guild","Feeding_guild_short",
##D                             "Feeding_mode", "Feeding_specialization",
##D                             "Feeding_tissue", "Feeding_plant_part",
##D                             "Endophagous_lifestyle", "Stratum_use",
##D                             "Stratum_use_short"),
##D                          units = c(Body_Size = "mm", Dispersal_ability = "unitless"),
##D                          keep = c(measurementRemark = "Remark"),
##D                          metadata = list(
##D                             license = "http://creativecommons.org/publicdomain/zero/1.0/"
##D                             )
##D )
##D head(dataset3)
##D 
##D updated <- mutate.traitdata(dataset3, predator = Feeding_guild == "c" )
##D 
##D head(updated[updated$traitName == "predator",])
##D 
##D levels(updated$traitName)
## End(Not run)

##

pulldata("heteroptera_raw")
dataset2 <- as.traitdata(heteroptera_raw,
                        traits = c("Body_length", "Body_width", "Body_height", "Thorax_length",
                                  "Thorax_width", "Head_width", "Eye_width", "Antenna_Seg1",
                                   "Antenna_Seg2", "Antenna_Seg3", "Antenna_Seg4", "Antenna_Seg5",
                                   "Front.Tibia_length", "Mid.Tibia_length", "Hind.Tibia_length",
                                   "Front.Femur_length", "Hind.Femur_length", "Front.Femur_width",
                                   "Hind.Femur_width", "Rostrum_length", "Rostrum_width",
                                   "Wing_length", "Wing_width"),
                        taxa = "SpeciesID",
                        occurrences = "ID"
)
updated <- mutate.traitdata(dataset2,
                            Body_shape = Body_length/Body_width,
                            Body_volume = Body_length*Body_width*Body_height,
                            Wingload = Wing_length*Wing_width/Body_volume)

head(updated[updated$traitName %in% c( "Body_volume"),])



