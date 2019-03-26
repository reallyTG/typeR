library(dqshiny)


### Name: create_dq_box_group
### Title: Create a dq box group
### Aliases: create_dq_box_group

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    fluidRow(
      column(6,
        dq_box("Random Input1", dq_space(), "End of Content", id = "box1",
          title = "Box1", width = 12, open_callback = TRUE),
        dq_box("Random Input2", dq_space(), "End of Content", id = "box2",
          title = "Box2", width = 9, collapsed = TRUE, open_callback = TRUE),
        dq_box("Random Input3", dq_space(), "End of Content", id = "box3",
          title = "Box3", width = 12, collapsed = TRUE, open_callback = TRUE)
      )
    )
  ),
  server = function(input, output, session) {
    create_dq_box_group(session, "box1", "box2", "box3")
  }
)

}



