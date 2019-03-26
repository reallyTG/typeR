library(taxa)


### Name: map_data
### Title: Create a mapping between two variables
### Aliases: map_data

### ** Examples

# Mapping between two variables in `all_names(ex_taxmap)`
map_data(ex_taxmap, from = taxon_names, to = n_legs > 0)

# Mapping with external variables
x = c("d" = "looks like a cat", "h" = "big scary cats",
      "i" = "smaller cats", "m" = "might eat you", "n" = "Meow! (Feed me!)")
map_data(ex_taxmap, from = taxon_names, to = x)




