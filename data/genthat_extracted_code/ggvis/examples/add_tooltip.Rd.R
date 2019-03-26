library(ggvis)


### Name: add_tooltip
### Title: Add tooltips to a plot.
### Aliases: add_tooltip

### ** Examples

## Run these examples only in interactive R sessions
if (interactive()) {

all_values <- function(x) {
  if(is.null(x)) return(NULL)
  paste0(names(x), ": ", format(x), collapse = "<br />")
}

base <- mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points()
base %>% add_tooltip(all_values, "hover")
base %>% add_tooltip(all_values, "click")

# The data sent from client to the server contains only the data columns that
# are used in the plot. If you want to get other columns of data, you should
# to use a key to line up the item from the plot with a row in the data.
mtc <- mtcars
mtc$id <- 1:nrow(mtc)  # Add an id column to use ask the key

all_values <- function(x) {
  if(is.null(x)) return(NULL)
  row <- mtc[mtc$id == x$id, ]
  paste0(names(row), ": ", format(row), collapse = "<br />")
}

mtc %>% ggvis(x = ~wt, y = ~mpg, key := ~id) %>%
  layer_points() %>%
  add_tooltip(all_values, "hover")

}



