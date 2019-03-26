library(r2d3)


### Name: save_d3_html
### Title: Save a D3 visualization as HTML
### Aliases: save_d3_html

### ** Examples

library(r2d3)

viz <- r2d3(
  data = c(0.3, 0.6, 0.8, 0.95, 0.40, 0.20),
  script = system.file("examples/barchart.js", package = "r2d3")
)

save_d3_html(
  viz,
  file = tempfile(fileext = ".html"),
  selfcontained = FALSE
)



