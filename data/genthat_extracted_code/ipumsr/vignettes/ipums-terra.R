## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.height = 4, 
  fig.width = 6
)

## ---- echo = FALSE-------------------------------------------------------
if (!suppressPackageStartupMessages(require(sf))) {
  message("Could not find sf package and so could not run vignette.")
  knitr::opts_chunk$set(eval = FALSE)
}

raster_extract <- system.file("extdata", "4540_bundle.zip", package = "terraexample")
area_extract <- system.file("extdata", "4618_bundle.zip", package = "terraexample")
micro_extract <- system.file("extdata", "4621_bundle.zip", package = "terraexample")
if (!file.exists(micro_extract) | !file.exists(area_extract) | !file.exists(micro_extract)) {
  message("Could not find terra data and so could not run vignette.")
  knitr::opts_chunk$set(eval = FALSE)
}

## ------------------------------------------------------------------------
library(ipumsr)
library(ggplot2)
library(dplyr)
library(sf)

## ------------------------------------------------------------------------
ipums_list_files(raster_extract)

## ------------------------------------------------------------------------
febtemp <- read_terra_raster(raster_extract, matches("TEMPAVGFEB"))

## ------------------------------------------------------------------------
# Crop map a bit
zoomed_extent <- raster::extent(c(-180, -64, 16.5, 72.5))

raster::plot(febtemp / 10, ext = zoomed_extent)
title("Average temp (deg C) in Feb\n1950-2010 (US raster)")

## ------------------------------------------------------------------------
all_rasters <- read_terra_raster_list(raster_extract)

## ---- eval = FALSE-------------------------------------------------------
#  raster::plot(all_rasters[["TEMPAVGFEBUS2013"]] / 10, ext = zoomed_extent)
#  title("Average temp (deg C) in Feb\n1950-2010 (US raster)")

## ------------------------------------------------------------------------
pop_pct65 <- all_rasters[["UnitedStatesStates-2010-POP6569"]] / 
  all_rasters[["UnitedStatesStates-2010-TOTPOP"]]

raster::plot(pop_pct65, ext = zoomed_extent)
title("Percent of population ages 65-69 in 2010\n(raseterized area)")

## ------------------------------------------------------------------------
ipums_list_files(area_extract)

## ------------------------------------------------------------------------
terra_area <- read_terra_area_sf(area_extract)

## ------------------------------------------------------------------------
terra_area <- terra_area %>% 
  mutate(feb_temp_c = TEMPAVGFEB_mean_GEO2_US2010_WORLDCLIM / 10)


ggplot(terra_area, aes(fill = feb_temp_c)) + 
  geom_sf(linetype = "blank") + 
  coord_sf(xlim = c(-180, -64), ylim = c(16.5, 72.5)) + # Crop out Alaska's East Hemisphere tail
  ggtitle("Average temp (deg C) in Feb\n1950-2010 (US Geo2)")

## ------------------------------------------------------------------------
terra_area <- terra_area %>%
  mutate(
    pct_pop_65 =
      (POP6569_GEO2_US2010_US2010A + POP7074_GEO2_US2010_US2010A +
         POP7579_GEO2_US2010_US2010A + POP80_GEO2_US2010_US2010A) /
      (TOTPOP_GEO2_US2010_US2010A)
  )

ggplot(terra_area, aes(x = pct_pop_65, y = feb_temp_c)) + 
  geom_point(alpha = 0.2) + 
  ggtitle("Average temperature against percent of\npopulation over 65 by US Geo 2")


## ------------------------------------------------------------------------
ipums_list_files(micro_extract)

## ------------------------------------------------------------------------
terra_micro <- read_terra_micro(micro_extract)
terra_micro_shapes <- read_ipums_sf(micro_extract)

## ------------------------------------------------------------------------
graph_data <- terra_micro %>%
  mutate(moved_states = MIGUS2 != GEO1_US2010) %>%
  group_by(GEO2_US2010, age65plus = ifelse(AGE >= 65, "65 and older", "Under 65")) %>%
  summarize(
    moved_states = weighted.mean(moved_states, PERWT),
    feb_temp_c = TEMPAVGFEB_mean_GEO2_US2010_WORLDCLIM[1] / 10
  )

# ipums_shape_inner_join() will join the 2 datasets together, and keep
# only observations that are in both files. In this case, we only
# lose one observation that turns out to be the Great lakes.
graph_data <- ipums_shape_inner_join(
  graph_data, 
  terra_micro_shapes,
  by = c("GEO2_US2010" = "GEOID")
)

# Look at percent of population 65 and older who have moved in last year
ggplot(
  graph_data %>% filter(age65plus == "65 and older"), 
  aes(fill = moved_states)
) + 
  geom_sf(linetype = "blank") + 
  coord_sf(xlim = c(-180, -64), ylim = c(16.5, 72.5)) + # Crop out Alaska's East Hemisphere tail
  ggtitle("65 and older: percent moved from another\nstate in last year")

