library(pivottabler)


### Name: PivotStyles
### Title: A class that defines a collection of styles.
### Aliases: PivotStyles
### Keywords: datasets

### ** Examples

pt <- PivotTable$new()
# ...
pivotStyles <- PivotStyles$new(pt, themeName="compact")
pivotStyles$addStyle(styleName="MyNewStyle", list(
    font="0.75em arial",
    padding="2px",
    border="1px solid lightgray",
    "vertical-align"="middle",
    "text-align"="center",
    "font-weight"="bold",
    "background-color"="#F2F2F2"
  ))



