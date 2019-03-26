library(shinybootstrap2)


### Name: fixedPage
### Title: Create a page with a fixed layout
### Aliases: fixedPage fixedRow

### ** Examples

library(shiny)

fixedPage(
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



