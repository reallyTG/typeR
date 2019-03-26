library(DAISIE)


### Name: DAISIE_dataprep
### Title: Prepare colonisation and branching time data to run in DAISIE.
### Aliases: DAISIE_dataprep
### Keywords: models

### ** Examples
 



### Create Galapagos data object where all taxa have the same macroevolutionary process

data(Galapagos_datatable)
DAISIE_dataprep(
   datatable = Galapagos_datatable,
   island_age = 4,
   M = 1000
   )

### Create Galapagos data object with a distinct macroevolutionary processes
# for the Darwin's finches. One process applies to type 1 species (all species 
# except for Darwin's finches) and the other applies only to type 2 species 
# (Darwin's finches). Set fraction of potential colonists of type 2 to be
# proportional to the number of type2 clades present on the island.

data(Galapagos_datatable)
DAISIE_dataprep(
   datatable = Galapagos_datatable,
   island_age = 4,
   M = 1000,
   number_clade_types = 2,
   list_type2_clades = "Finches"
   )

### Create Galapagos data object with a distinct macroevolutionary processes 
# for the Darwin's finches. One process applies to type 1 species (all species
# except for Darwin's finches) and the other applies only to type 2 species 
# (Darwin's finches). Set fraction of potential colonists of type 2 to be 0.163.

data(Galapagos_datatable)
DAISIE_dataprep(
   datatable = Galapagos_datatable,
   island_age = 4,
   M = 1000,
   number_clade_types = 2,
   list_type2_clades = "Finches",
   prop_type2_pool = 0.163
   )



