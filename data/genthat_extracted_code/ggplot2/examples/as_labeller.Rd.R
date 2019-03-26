library(ggplot2)


### Name: as_labeller
### Title: Coerce to labeller function
### Aliases: as_labeller
### Keywords: internal

### ** Examples

p <- ggplot(mtcars, aes(disp, drat)) + geom_point()
p + facet_wrap(~am)

# Rename labels on the fly with a lookup character vector
to_string <- as_labeller(c(`0` = "Zero", `1` = "One"))
p + facet_wrap(~am, labeller = to_string)

# Quickly transform a function operating on character vectors to a
# labeller function:
appender <- function(string, suffix = "-foo") paste0(string, suffix)
p + facet_wrap(~am, labeller = as_labeller(appender))

# If you have more than one faceting variable, be sure to dispatch
# your labeller to the right variable with labeller()
p + facet_grid(cyl ~ am, labeller = labeller(am = to_string))



