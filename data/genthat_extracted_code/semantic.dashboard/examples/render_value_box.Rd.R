library(semantic.dashboard)


### Name: render_value_box
### Title: Create a value box output.
### Aliases: render_value_box renderValueBox renderInfoBox

### ** Examples

## No test: 
valueBoxOutput("value_box")

output$value_box <- renderValueBox({
  valueBox(
    value = 33.45,
    subtitle = "Simple valuebox",
    icon = icon("bar chart"),
    color = "purple",
    width = 5)
})
## End(No test)



