library(kableExtra)


### Name: kable_styling
### Title: HTML table attributes
### Aliases: kable_styling

### ** Examples

x_html <- knitr::kable(head(mtcars), "html")
kable_styling(x_html, "striped", position = "left", font_size = 7)

x_latex <- knitr::kable(head(mtcars), "latex")
kable_styling(x_latex, latex_options = "striped", position = "float_left")




