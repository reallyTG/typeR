library(traitdataform)


### Name: cast.traitdata
### Title: Cast long-table trait data into wide-table format
### Aliases: cast.traitdata

### ** Examples


pulldata("arthropodtraits")
head(arthropodtraits)
dataset3 <- as.traitdata(arthropodtraits,
                         taxa = "SpeciesID",
                         traits = c("Body_Size", "Dispersal_ability",
                               "Feeding_guild","Feeding_guild_short",
                               "Feeding_mode", "Feeding_specialization",
                               "Feeding_tissue", "Feeding_plant_part",
                               "Endophagous_lifestyle", "Stratum_use",
                               "Stratum_use_short"),
                         units = c(Body_Size = "mm"),
                         keep = c(measurementRemark = "Remark"),
                         metadata = as.metadata(
                            license = "http://creativecommons.org/publicdomain/zero/1.0/"
                            )
)

head(dataset3)

dd3 <-cast.traitdata(dataset3)
head(dd3)





