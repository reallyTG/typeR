library(shiny)


### Name: fixedPage
### Title: Create a page with a fixed layout
### Aliases: fixedPage fixedRow

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

ui <- fixedPage(
  title = "Hello, Shiny!",
  fixedRow(
    column(width = 4,
      "4"
    ),
    column(width = 3, offset = 2,
      "3 offset 2"
    )
  )
)

shinyApp(ui, server = function(input, output) { })
}




