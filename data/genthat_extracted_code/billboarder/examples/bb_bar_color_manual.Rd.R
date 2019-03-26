library(billboarder)


### Name: bb_bar_color_manual
### Title: Manual color for barchart
### Aliases: bb_bar_color_manual

### ** Examples

## Not run: 
##D 
##D library("data.table")
##D library("billboarder")
##D 
##D data("mpg", package = "ggplot2")
##D setDT(mpg)
##D 
##D # all in blue
##D manufa <- unique(mpg$manufacturer)
##D cols <- rep("#08298A", length(manufa))
##D names(cols) <- manufa
##D 
##D # Nissan in red
##D cols[["nissan"]] <- "#DF0101"#' 
##D 
##D billboarder() %>%
##D   bb_barchart(data = mpg[, list(count = .N), by = manufacturer][order(count)]) %>%
##D   bb_bar_color_manual(values = cols)
## End(Not run)



