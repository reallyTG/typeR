library(plotly)


### Name: remove_typedarray_polyfill
### Title: Remove TypedArray polyfill
### Aliases: remove_typedarray_polyfill

### ** Examples


## Not run: 
##D p1 <- plot_ly()
##D p2 <- remove_typedarray_polyfill(p1)
##D t1 <- tempfile(fileext = ".html")
##D htmlwidgets::saveWidget(p1, t1)
##D file.info(t1)$size
##D htmlwidgets::saveWidget(p2, t1)
##D file.info(t1)$size
## End(Not run)



