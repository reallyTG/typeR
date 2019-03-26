library(atlantistools)


### Name: plot_spatial_box
### Title: Visualize the spatial distribution per species and stanza
###   combination.
### Aliases: plot_spatial_box

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")

bgm_as_df <- convert_bgm(file.path(d, "VMPA_setas.bgm"))

# Spatial distribution in Atlantis is based on adu- and juv stanzas.
# Therefore, we need to aggregate the age-based biomass to
# stanzas with \code{combine_ages}.
bio_spatial <- combine_ages(ref_bio_sp, grp_col = "species", agemat = ref_agemat)

## Not run: 
##D # Apply \code{plot_spatial_box}
##D grobs <- plot_spatial_box(bio_spatial, bgm_as_df, timesteps = 3)
##D gridExtra::grid.arrange(grobs[[1]])
##D gridExtra::grid.arrange(grobs[[9]])
##D 
##D # use names() to select specific plots
##D names(grobs)
## End(Not run)

# Plot specific species
grobs <- plot_spatial_box(bio_spatial, bgm_as_df,
                          select_species = "Shallow piscivorous fish", timesteps = 3)
gridExtra::grid.arrange(grobs[[1]])



