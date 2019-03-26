library(shinydashboardPlus)


### Name: userPost
### Title: AdminLTE2 user post
### Aliases: userPost

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
      title = "Box with user comment",
      status = "primary",
      userPost(
       id = 1,
       src = "https://adminlte.io/themes/AdminLTE/dist/img/user1-128x128.jpg",
       author = "Jonathan Burke Jr.",
       description = "Shared publicly - 7:30 PM today",
       "Lorem ipsum represents a long-held tradition for designers, 
       typographers and the like. Some people hate it and argue for 
       its demise, but others ignore the hate as they create awesome 
       tools to help create filler text for everyone from bacon 
       lovers to Charlie Sheen fans.",
       userPostToolItemList(
        userPostToolItem(dashboardLabel("item 1")),
        userPostToolItem(dashboardLabel("item 2", status = "danger"), side = "right")
       )
      ),
      userPost(
       id = 2,
       src = "https://adminlte.io/themes/AdminLTE/dist/img/user6-128x128.jpg",
       author = "Adam Jones",
       description = "Shared publicly - 5 days ago",
       userPostMedia(src = "https://adminlte.io/themes/AdminLTE/dist/img/photo2.png"),
       userPostToolItemList(
        userPostToolItem(dashboardLabel("item 1")),
        userPostToolItem(dashboardLabel("item 2", status = "danger"), side = "right")
       )
      )
     )
    ),
    title = "userPost"
  ),
  server = function(input, output) { }
 )
}




