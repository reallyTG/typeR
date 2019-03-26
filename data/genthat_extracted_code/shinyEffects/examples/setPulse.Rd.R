library(shinyEffects)


### Name: setPulse
### Title: Custom pulse animation
### Aliases: setPulse

### ** Examples

 if (interactive()) {

  library(shiny)
  library(shinydashboard)
  library(shinydashboardPlus)
  library(shinyEffects)

  boxTag <- boxPlus(
   title = "Closable box, with label",
   closable = TRUE,
   enable_label = TRUE,
   label_text = 1,
   label_status = "danger",
   status = "warning",
   solidHeader = FALSE,
   collapsible = TRUE,
   p("Box Content")
  )

  shinyApp(
   ui = dashboardPagePlus(
     header = dashboardHeaderPlus(
       enable_rightsidebar = TRUE,
       rightSidebarIcon = "gears"
     ),
     sidebar = dashboardSidebar(),
     body = dashboardBody(

      setPulse(class = "box", duration = 1, iteration = 100),
      setPulse(id = "my-progress", duration = 1, iteration = 100),

      tags$h2("Add pulse animation to the box class"),
      fluidRow(boxTag, boxTag),
      tags$h2("Add pulse animation only to the first element using id"),
      tagAppendAttributes(
       verticalProgress(
        value = 10,
        striped = TRUE,
        active = TRUE
       ),
       id = "my-progress"
      ),
      verticalProgress(
        value = 50,
        active = TRUE,
        status = "warning",
        size = "xs"
      ),
      verticalProgress(
        value = 20,
        status = "danger",
        size = "sm",
        height = "60%"
      )
     ),
     rightsidebar = rightSidebar(),
     title = "DashboardPage"
   ),
   server = function(input, output) { }
  )
}



