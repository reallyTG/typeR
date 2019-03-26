library(plotly)


### Name: partial_bundle
### Title: Use a partial bundle of plotly.js
### Aliases: partial_bundle

### ** Examples


# ----------------------------------------------------------------------
# This function is always safe to use when rendering a single 
# plotly graph. In this case, we get a 3x file reduction.
# ----------------------------------------------------------------------

library(plotly)
p <- plot_ly(x = 1:10, y = 1:10) %>% add_markers()
save_widget <- function(p, f) {
  owd <- setwd(dirname(f))
  on.exit(setwd(owd))
  htmlwidgets::saveWidget(p, f)
  mb <- round(file.info(f)$size / 1e6, 3)
  message("File is: ", mb," MB")
}
f1 <- tempfile(fileext = ".html")
f2 <- tempfile(fileext = ".html")
save_widget(p, f1)
save_widget(partial_bundle(p), f2)

# ----------------------------------------------------------------------
# But, since plotly.js bundles override one another, 
# be careful when putting multiple graphs in a larger document!
# Note how the surface (part of the gl3d bundle) renders, but the 
# heatmap (part of the cartesian bundle) doesn't...
# ----------------------------------------------------------------------

## Not run: 
##D library(htmltools)
##D p1 <- plot_ly(z = ~volcano) %>% 
##D   add_heatmap() %>%
##D   partial_bundle()
##D p2 <- plot_ly(z = ~volcano) %>% 
##D   add_surface() %>%
##D   partial_bundle()
##D browsable(tagList(p1, p2))
## End(Not run)




