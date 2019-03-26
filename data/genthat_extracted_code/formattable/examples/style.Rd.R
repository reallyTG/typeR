library(formattable)


### Name: style
### Title: Create a string-representation of CSS style
### Aliases: style

### ** Examples

style(color = "red")
style(color = "red", "font-weight" = "bold")
style("background-color" = "gray", "border-radius" = "4px")
style("padding-right" = "2px")

formattable(mtcars, list(
  mpg = formatter("span",
    style = x ~ style(color = ifelse(x > median(x), "red", NA)))))



