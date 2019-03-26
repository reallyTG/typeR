library(officer)


### Name: ph_with_gg
### Title: add ggplot to a pptx presentation
### Aliases: ph_with_gg ph_with_gg_at

### ** Examples

if( require("ggplot2") ){
  doc <- read_pptx()
  doc <- add_slide(doc, layout = "Title and Content",
    master = "Office Theme")

  gg_plot <- ggplot(data = iris ) +
    geom_point(mapping = aes(Sepal.Length, Petal.Length), size = 3) +
    theme_minimal()

  if( capabilities(what = "png") ){
    doc <- ph_with_gg(doc, value = gg_plot )
    doc <- ph_with_gg_at(doc, value = gg_plot,
      height = 4, width = 8, left = 4, top = 4 )
  }

  print(doc, target = tempfile(fileext = ".pptx"))
}



