library(shinydashboardPlus)


### Name: todoList
### Title: AdminLTE2 todo list container
### Aliases: todoList

### ** Examples

if (interactive()) {
 library(shiny)
 library(shinydashboard)
 library(shinyjqui)
 shinyApp(
  ui = dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(
     box(
      "Sortable todo list demo",
      status = "warning",
      todoList(
        todoListItem(
          label = "Design a nice theme",
          "Some text here"
        ),
        todoListItem(
          label = "Make the theme responsive",
          "Some text here"
        ),
        todoListItem(
          checked = TRUE,
          label = "Let theme shine like a star"
        )
       )
      ),
      box(
      "Simple todo list demo",
      status = "warning",
      todoList(
      sortable = FALSE,
        todoListItem(
          label = "Design a nice theme",
          "Some text here"
        ),
        todoListItem(
          label = "Make the theme responsive",
          "Some text here"
        ),
        todoListItem(
          checked = TRUE,
          label = "Let theme shine like a star"
        )
       )
      )
    ),
    title = "Todo Lists"
  ),
  server = function(input, output) { }
 )
}




