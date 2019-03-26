library(semantic.dashboard)


### Name: value_box_output
### Title: Create a value box output.
### Aliases: value_box_output valueBoxOutput infoBoxOutput

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



