library(tippy)


### Name: tippy
### Title: Create a tooltip
### Aliases: tippy tippy_this

### ** Examples

tippy("Hover me!", tooltip = "Hi, I'm the tooltip!")
tippy("Hover me!", tooltip = "Hi, I'm the tooltip!", placement = "right",
  theme = "light")
tippy("Hover me!", tooltip = "Hi, I'm the tooltip!", animation = "scale",
  duration = 1000, placement = "bottom")
tippy("Click me!", tooltip = "Hi, I'm the tooltip!", trigger = "click",
  theme = "light")

# use tooltip on other elements.
if(interactive()){
library(shiny)

shinyApp(
  ui = fluidPage(
    textInput("input", "input with tooltip"),
    tippy("Some text", tooltip = "Tiiiip"),
    tippy_this("input", "Tooltip", placement = "right")
 ),
 server = function(input, output) {}
)
}




