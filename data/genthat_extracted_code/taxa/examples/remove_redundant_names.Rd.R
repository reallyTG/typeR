library(taxa)


### Name: remove_redundant_names
### Title: Remove redundant parts of taxon names
### Aliases: remove_redundant_names

### ** Examples

# Remove genus named from species taxa
species_data <- c("Carnivora;Felidae;Panthera;Panthera leo",
                  "Carnivora;Felidae;Panthera;Panthera tigris",
                  "Carnivora;Ursidae;Ursus;Ursus americanus")
obj <-  parse_tax_data(species_data, class_sep = ";")
remove_redundant_names(obj)



