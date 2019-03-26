library(ggformula)


### Name: gf_sf
### Title: Mapping with shape files
### Aliases: gf_sf

### ** Examples


if (require(maps) && require(maptools) &&
  require(sf) && require(rgeos) &&
  utils::packageVersion("ggplot2") > "2.2.1") {
  US <- sf::st_as_sf(map('state', plot = FALSE, fill = TRUE))
  gf_sf( fill = ~ factor(nchar(ID)), data = US) %>%
  gf_refine(coord_sf())

  # We can specify shape data and external data separately using geometry
  MI <- sf::st_as_sf(map('county', 'michigan', plot = FALSE, fill = TRUE))
  gf_sf(fill = ~ log10(population), data = MIpop %>% dplyr::arrange(county),
        geometry = ~ MI$geometry, color = "white") %>%
  gf_refine(coord_sf(), theme_bw())

  # alternatively we can merge external data and shape data into one data frame.
  MI %>%
    dplyr::mutate(county = gsub("michigan,", "", ID)) %>%
    dplyr::left_join(MIpop %>% dplyr::mutate(county = tolower(county))) %>%
    gf_sf(fill = ~ population/1e3) %>%
  gf_refine(
    coord_sf(), theme_bw(),
    scale_fill_continuous(name = "population (thousands)", trans = "log10"))
}



