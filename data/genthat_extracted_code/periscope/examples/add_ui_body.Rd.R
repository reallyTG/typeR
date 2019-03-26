library(periscope)


### Name: add_ui_body
### Title: Add UI Elements to the Body area
### Aliases: add_ui_body

### ** Examples

require(shiny)

body1 <- htmlOutput("example1")
body2 <- actionButton("exButton", label = "Example")

add_ui_body(list(body1, body2))




