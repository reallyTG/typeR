library(traits)


### Name: betydb
### Title: Search for traits from BETYdb
### Aliases: betydb betydb_record betydb_trait betydb_specie
###   betydb_citation betydb_site

### ** Examples

## Not run: 
##D # General Search
##D out <- betydb_search(query = "Switchgrass Yield")
##D library("dplyr")
##D out %>%
##D  group_by(id) %>%
##D  summarise(mean_result = mean(as.numeric(mean), na.rm = TRUE)) %>%
##D  arrange(desc(mean_result))
##D # Get by ID
##D ## Traits
##D betydb_trait(id = 10)
##D ## Species
##D betydb_specie(id = 1)
##D ## Citations
##D betydb_citation(id = 1)
##D ## Site information
##D betydb_site(id = 795)
## End(Not run)



