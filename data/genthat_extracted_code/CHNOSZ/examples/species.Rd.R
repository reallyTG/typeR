library(CHNOSZ)


### Name: species
### Title: Species of Interest
### Aliases: species

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
# set up the basis species
basis("CHNOS")
# add, modify, delete species
species(c("CO2","NH3"))  # aqueous species
species(c("CO2","NH3"),"gas")  # gases
# delete the first couple of species
species(1:2,delete=TRUE)
# modify the logarithms of activities (actually
# fugacities) of the remaining species
species(1:2,c(-2,-5))
# set the species to aqueous
species(1:2,"aq")
# delete all the species (returns the existing species
# definition, then deletes the species)
sd <- species(delete=TRUE)

# changing the elements in the basis definition
# causes species to be deleted
basis(c("CaO", "CO2", "H2O", "SiO2", "MgO", "O2"))
species(c("dolomite", "quartz", "calcite", "forsterite"))
basis(c("CO2", "H2O", "O2"))
species()  # NULL



