library(rnpn)


### Name: npn_species
### Title: Get scientific names.
### Aliases: npn_species npn_species_comm npn_species_id npn_species_itis
###   npn_species_sci npn_species_search npn_species_state

### ** Examples

## Not run: 
##D head( npn_species() )
##D npn_species_itis(ids = 27806)
##D npn_species_itis(ids = c(27806,36616))
##D npn_species_id(ids = 3)
##D npn_species_state(state = "HI")
##D npn_species_state(state = "HI", kingdom = "Plantae")
##D npn_species_sci(genus = "Clintonia", species = "borealis")
##D npn_species_comm(name = "thickleaved wild strawberry")
##D npn_species_comm(name = c("thickleaved wild strawberry","bluebead"))
##D npn_species_search(groups = 3, year = 2010)
##D npn_species_search(groups = c(3,9), year = 2010)
##D 
##D library('httr')
##D npn_species_itis(ids = 27806, config=verbose())
## End(Not run)



