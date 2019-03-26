library(vegalite)


### Name: capture_widget
### Title: Capture a static (png) version of a widget (e.g. for use in a
###   PDF knitr document)
### Aliases: capture_widget

### ** Examples

## Not run: 
##D library(webshot)
##D library(vegalite)
##D 
##D dat <- jsonlite::fromJSON('[
##D       {"a": "A","b": 28}, {"a": "B","b": 55}, {"a": "C","b": 43},
##D       {"a": "D","b": 91}, {"a": "E","b": 81}, {"a": "F","b": 53},
##D       {"a": "G","b": 19}, {"a": "H","b": 87}, {"a": "I","b": 52}
##D     ]')
##D 
##D vegalite(viewport_width=350, viewport_height=250) %>%
##D   add_data(dat) %>%
##D   encode_x("a", "ordinal") %>%
##D   encode_y("b", "quantitative") %>%
##D   mark_bar() -> vl
##D 
##D capture_widget(vl, "inline", 250, 350)
## End(Not run)



