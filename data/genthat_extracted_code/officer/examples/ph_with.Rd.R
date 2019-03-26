library(officer)


### Name: ph_with
### Title: add object into a new shape
### Aliases: ph_with ph_with.character ph_with.numeric ph_with.factor
###   ph_with.logical ph_with.block_list ph_with.unordered_list
###   ph_with.data.frame ph_with.gg ph_with.external_img

### ** Examples

library(magrittr)

fileout <- tempfile(fileext = ".pptx")
doc <- read_pptx()
doc <- add_slide(doc, layout = "Two Content",
  master = "Office Theme")
doc <- ph_with(x = doc, value = c("Un titre", "Deux titre"),
               location = ph_location_left() )
doc <- ph_with(x = doc, value = iris[1:4, 3:5],
               location = ph_location_right() )

if( require("ggplot2") ){
  doc <- add_slide(doc, layout = "Title and Content",
    master = "Office Theme")
  gg_plot <- ggplot(data = iris ) +
    geom_point(mapping = aes(Sepal.Length, Petal.Length),
      size = 3) +
    theme_minimal()
  doc <- ph_with(x = doc, value = gg_plot,
                 location = ph_location_fullsize() )
}

doc <- add_slide(doc, layout = "Title and Content",
  master = "Office Theme")
img.file <- file.path( R.home("doc"), "html", "logo.jpg" )
doc <- ph_with(x = doc, external_img(img.file, 100/72, 76/72),
               location = ph_location_right() )

# unordered_list ----
ul <- unordered_list(
  level_list = c(1, 2, 2, 3, 3, 1),
  str_list = c("Level1", "Level2", "Level2", "Level3", "Level3", "Level1"),
  style = fp_text(color = "red", font.size = 0) )
doc <- add_slide(doc, layout = "Title and Content",
                 master = "Office Theme")
doc <- ph_with(x = doc, value = ul,
               location = ph_location_fullsize() )

print(doc, target = fileout )



