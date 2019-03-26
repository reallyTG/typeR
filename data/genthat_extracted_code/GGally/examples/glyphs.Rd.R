library(GGally)


### Name: glyphs
### Title: Create the data needed to generate a glyph plot.
### Aliases: glyphs

### ** Examples

 data(nasa)
 nasaLate <- nasa[
   nasa$date >= as.POSIXct("1998-01-01") &
   nasa$lat >= 20 &
   nasa$lat <= 40 &
   nasa$long >= -80 &
   nasa$long <= -60
 , ]
 temp.gly <- glyphs(nasaLate, "long", "day", "lat", "surftemp", height=2.5)
 ggplot2::ggplot(temp.gly, ggplot2::aes(gx, gy, group = gid)) +
   add_ref_lines(temp.gly, color = "grey90") +
   add_ref_boxes(temp.gly, color = "grey90") +
   ggplot2::geom_path() +
   ggplot2::theme_bw() +
   ggplot2::labs(x = "", y = "")



