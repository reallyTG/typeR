library(shinydashboardPlus)


### Name: boxProfile
### Title: AdminLTE2 box profile
### Aliases: boxProfile

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
      title = "Box with profile",
      status = "primary",
      boxProfile(
       src = "https://adminlte.io/themes/AdminLTE/dist/img/user4-128x128.jpg",
       title = "Nina Mcintire",
       subtitle = "Software Engineer",
       boxProfileItemList(
        bordered = TRUE,
        boxProfileItem(
         title = "Followers",
         description = 1322
        ),
        boxProfileItem(
         title = "Following",
         description = 543
        ),
        boxProfileItem(
         title = "Friends",
         description = 13287
        )
       )
      )
     )
    ),
    title = "boxProfile"
  ),
  server = function(input, output) { }
 )
}




