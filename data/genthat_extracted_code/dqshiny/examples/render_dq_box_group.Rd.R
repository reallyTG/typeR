library(dqshiny)


### Name: render_dq_box_group
### Title: Directly render a set of dq_boxes as a group
### Aliases: render_dq_box_group

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    fluidRow(column(6, uiOutput("myGroup")))
  ),
  server = function(input, output) {
    output$myGroup <- render_dq_box_group(
      dq_box("Random Input1", dq_space(), "End of Content",
        title = "TestBox1", width = 12),
      dq_box("Random Input2", dq_space(), "End of Content",
        title = "TestBox2", width = 9),
      dq_box("Random Input3", dq_space(), "End of Content",
        title = "TestBox3", width = 12),
      open = 3L)
  }
)

}



