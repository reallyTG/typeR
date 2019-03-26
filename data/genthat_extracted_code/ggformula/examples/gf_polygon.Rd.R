library(ggformula)


### Name: gf_polygon
### Title: Formula interface to geom_polygon()
### Aliases: gf_polygon

### ** Examples

gf_polygon()
if (require(maps) && require(ggthemes) && require(dplyr)) {
  US <- map_data("state") %>%
    dplyr::mutate(name_length = nchar(region))
  States <- US %>%
    dplyr::group_by(region) %>%
    dplyr::summarise(lat = mean(range(lat)), long = mean(range(long))) %>%
    dplyr::mutate(name = abbreviate(region, 3))

  gf_polygon(lat ~ long, data = US, group = ~ group,
             fill = ~ name_length, color = "white") %>%
  gf_text(lat ~ long, label = ~ name, data = States,
    color = "gray70", inherit = FALSE) %>%
  gf_refine(ggthemes::theme_map())
}




