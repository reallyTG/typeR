library(shar)


### Name: results_habitat_association
### Title: results_habitat_association
### Aliases: results_habitat_association

### ** Examples

landscape_classified <- classify_habitats(landscape, classes = 5)
species_a_random <- fit_point_process(species_a, n_random = 199)
results_habitat_association(pattern = species_a_random, raster = landscape_classified)




