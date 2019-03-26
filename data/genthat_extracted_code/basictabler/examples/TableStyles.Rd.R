library(basictabler)


### Name: TableStyles
### Title: A class that defines a collection of styles.
### Aliases: TableStyles
### Keywords: datasets

### ** Examples

# Creating styles is part of defining a theme for a table.
# Multiple styles must be created for each theme.
# The example below shows how to create one style.
# For an example of creating a full theme please
# see the Styling vignette.
tbl <- BasicTable$new()
# ...
TableStyles <- TableStyles$new(tbl, themeName="compact")
TableStyles$addStyle(styleName="MyNewStyle", list(
    font="0.75em arial",
    padding="2px",
    border="1px solid lightgray",
    "vertical-align"="middle",
    "text-align"="center",
    "font-weight"="bold",
    "background-color"="#F2F2F2"
  ))



