library(highcharter)


### Name: hcaes_string
### Title: Define aesthetic mappings using strings. Similar in spirit to
###   'ggplot2::aes_string'
### Aliases: hcaes_string hcaes_

### ** Examples

hchart(mtcars, "point", hcaes_string("hp", "mpg", group = "cyl"))

hcaes_string(x = 'xval', color = 'colorvar', group = 'grvar')



