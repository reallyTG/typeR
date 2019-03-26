library(shinydashboardPlus)


### Name: attachmentBlock
### Title: AdminLTE2 attachment container
### Aliases: attachmentBlock

### ** Examples

if (interactive()) {
 library(shiny)
 library(shinydashboard)
 shinyApp(
  ui = dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(
     box(
      title = "Attachment example",
      attachmentBlock(
       src = "http://kiev.carpediem.cd/data/afisha/o/2d/c7/2dc7670333.jpg",
       title = "Test",
       title_url = "http://google.com",
       "This is the content"
      )
     )
    ),
    title = "AttachmentBlock"
  ),
  server = function(input, output) { }
 )
}




