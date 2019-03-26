library(midas)


### Name: turn_shiny
### Title: Turns a string of html into the equivalent shiny code
### Aliases: turn_shiny

### ** Examples

html <- '<div class="example"><h3>test</h3></div>'
turn_shiny(html)
eval(turn_shiny(html))



