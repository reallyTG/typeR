library(atlantistools)


### Name: plot_spatial_ts
### Title: Visualize the spatial distribution per species and stanza
###   combination.
### Aliases: plot_spatial_ts

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")

bgm_as_df <- convert_bgm(file.path(d, "VMPA_setas.bgm"))
vol <- agg_data(ref_vol, groups = c("time", "polygon"), fun = sum, out = "volume")

# Spatial distribution in Atlantis is based on adu- and juv stanzas.
# Therefore, we need to aggregate the age-based biomass to
# stanzas with \code{combine_ages}.
bio_spatial <- combine_ages(ref_bio_sp, grp_col = "species", agemat = ref_agemat)

# Apply \code{plot_spatial_ts}
grobs <- plot_spatial_ts(bio_spatial, bgm_as_df, vol)
gridExtra::grid.arrange(grobs[[1]])
gridExtra::grid.arrange(grobs[[7]])



