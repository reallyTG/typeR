library(spData)


### Name: congruent
### Title: Datasets to illustrate the concept of spatial congruence
### Aliases: congruent incongruent aggregating_zones
### Keywords: datasets sf

### ** Examples

if(requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  plot(aggregating_zones$geometry, lwd = 5)
  plot(congruent$geometry, add = TRUE, border = "green", lwd = 2)
  plot(incongruent$geometry, add = TRUE, border = "blue", col = NA)
  rbind(congruent, incongruent)
}
# Code used to download the data:
## Not run: 
##D devtools::install_github("robinlovelace/ukboundaries")
##D library(sf)
##D library(tmap)
##D library(dplyr)
##D library(ukboundaries)
##D sel = grepl("003|004", msoa2011_lds$geo_label)
##D aggregating_zones = st_transform(msoa2011_lds[sel, ], 27700)
##D # find lsoas in the aggregating_zones
##D lsoa_touching = st_transform(lsoa2011_lds, 27700)[aggregating_zones, ]
##D lsoa_cents = st_centroid(lsoa_touching)
##D lsoa_cents = lsoa_cents[aggregating_zones, ]
##D sel = lsoa_touching$geo_code %in% lsoa_cents$geo_code
##D # same for ed zones
##D ed_touching = st_transform(ed1981, 27700)[aggregating_zones, ]
##D ed_cents = st_centroid(ed_touching)
##D ed_cents = ed_cents[aggregating_zones, ]
##D incongruent_agg_ed = ed_touching[ed_cents, ]
##D set.seed(2017)
##D incongruent_agg_ed$value = rnorm(nrow(incongruent_agg_ed), mean = 5)
##D congruent = aggregate(incongruent_agg_ed["value"], lsoa_touching[sel, ], mean)
##D congruent$level = "Congruent"
##D congruent = congruent[c("level", "value")]
##D incongruent_cents = st_centroid(incongruent_agg_ed)
##D aggregating_value = st_join(incongruent_cents, congruent)$value.y
##D incongruent_agg = aggregate(incongruent_agg_ed["value"], list(aggregating_value), FUN = mean)
##D incongruent_agg$level = "Incongruent"
##D incongruent = incongruent_agg[c("level", "value")]
##D summary(st_geometry_type(congruent))
##D summary(st_geometry_type(incongruent))
##D incongruent = st_cast(incongruent, "MULTIPOLYGON")
##D summary(st_geometry_type(incongruent))
##D summary(st_geometry_type(aggregating_zones))
##D devtools::use_data(congruent, overwrite = TRUE)
##D devtools::use_data(incongruent, overwrite = TRUE)
##D devtools::use_data(aggregating_zones, overwrite = TRUE)
## End(Not run)



