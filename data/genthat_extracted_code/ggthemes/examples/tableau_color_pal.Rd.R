library(ggthemes)


### Name: tableau_color_pal
### Title: Tableau Color Palettes (discrete)
### Aliases: tableau_color_pal

### ** Examples

library("scales")

palettes <- ggthemes_data[["tableau"]][["color-palettes"]][["regular"]]
for (palname in names(palettes)) {
  pal <- tableau_color_pal(palname)
  max_n <- attr(pal, "max_n")
  show_col(pal(max_n))
  title(main = palname)
}



