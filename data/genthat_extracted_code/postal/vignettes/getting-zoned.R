## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  cache = FALSE
)

## ----load_pkgs, message=FALSE--------------------------------------------
library(ggplot2)
library(maps)
library(glue)
library(dplyr)
library(tidyr)
library(postal)
library(zipcode)

## ------------------------------------------------------------------------
data(zips_zones_sample)
zips_zones_sample

## ------------------------------------------------------------------------
data(zipcode)
zipcode %>% 
  as_tibble()

## ----load_zips-----------------------------------------------------------
zips <- 
  zipcode %>% 
  as_tibble() %>% 
  mutate(
    zip_trim = substr(zip, 1, 3)
  )

zips

## ----usps_zips-----------------------------------------------------------
(usps_zips <-
  tibble(
    zip =
      unique(zips_zones_sample$origin_zip) %>% 
      c(unique(zips_zones_sample$dest_zip)) 
  ) %>% 
  distinct())

## ----zips_lat_long-------------------------------------------------------
(zips_lat_long <- 
  zips %>% 
  distinct(zip_trim, .keep_all = TRUE) %>% 
  left_join(usps_zips, by = c("zip_trim" = "zip")) %>% 
  select(zip_trim, latitude, longitude))

## ----zips_zones_lat_long-------------------------------------------------
(zips_zones_lat_long <- 
  zips_zones_sample %>% 
  select(origin_zip, dest_zip, zone) %>% 
  left_join(zips_lat_long, by = c("origin_zip" = "zip_trim")) %>% 
  rename(
      lat_origin = latitude,
      long_origin = longitude) %>% 
  left_join(zips_lat_long, by = c("dest_zip" = "zip_trim")) %>% 
  rename(
      lat_dest = latitude,
      long_dest = longitude) %>% 
  drop_na(zone))

## ----us_map--------------------------------------------------------------
us <- 
  ggplot2::map_data("state") %>%
  as_tibble() 

## ------------------------------------------------------------------------
origin_prefix <- "041"

## ------------------------------------------------------------------------
filtered <- 
  zips_zones_lat_long %>% 
  filter(origin_zip == origin_prefix) %>% 
  left_join(us, by = c("lat_dest" = "lat", "long_dest" = "long")) %>% 
  filter(as.numeric(dest_zip) > 10 &
           long_dest < -50 &
           long_dest > -120)

## ----zone_map, eval=TRUE, warning=FALSE----------------------------------
ggplot() +
  geom_polygon(data = us, aes(x = long, y = lat, group = group), fill = "white", color = "black") +
  geom_density_2d(data = filtered,
             aes(long_dest, lat_dest, colour = factor(zone)),
             alpha = 1) +
  labs(x = "Longitude", y = "Latitude", colour = "Zone") +
  ggtitle("Shipping Zones from Portland, Maine",
          subtitle = glue("Origin zone prefix: {origin_prefix}")) +
  scale_colour_brewer(type = "seq", palette = "BrBG") +
  theme_classic(base_family = "Arial Narrow") +
  coord_quickmap()

