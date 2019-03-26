library(tippy)


### Name: use_tippy
### Title: Use tippy
### Aliases: use_tippy call_tippy

### ** Examples

if(interactive()){
library(shiny)

shinyApp(
  ui = fluidPage(
    use_tippy(),
    p("Some text", title = "tooltip"),
    p("Some text", title = "tooltip"),
    p("Some text", title = "tooltip"),
    p("Some text", title = "tooltip"),
    p("Some text", title = "tooltip"),
    p("Some text", title = "tooltip"),
    call_tippy("[title]") # all elements with title
 ),
 server = function(input, output) {}
)
}




