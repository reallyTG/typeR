library(dqshiny)


### Name: dq_handsontable_output
### Title: Adds an uiOutput and renders an enhanced rhandsontable html
###   widget
### Aliases: dq_handsontable_output dq_render_handsontable

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    dq_handsontable_output("randomTable", 9L)
  ),
  server = function(input, output, session) {
    hw <- c("Hello", "my", "funny", "world!")
    data <- data.frame(A = rep(hw, 500), B = hw[c(2,3,4,1)],
      C = 1:500, D = Sys.Date() - 0:499, stringsAsFactors = FALSE)
    dq_render_handsontable("randomTable", data,
      filters = c("S", "T", "R", "D"), sorting = c(dir = "up", col = "B"),
      page_size = c(17L, 5L, 500L, 1000L), width_align = TRUE,
      col_param = list(list(col = 1L, type = "dropdown", source = letters)),
      cell_param = list(list(row = 2:9, col = 1:2, readOnly = TRUE))
    )
  }
)

}



