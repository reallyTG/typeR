library(bs4Dash)


### Name: bs4Timeline
### Title: AdminLTE3 timeline block
### Aliases: bs4Timeline

### ** Examples

if(interactive()){
 library(shiny)
 library(bs4Dash)

 shiny::shinyApp(
   ui = bs4DashPage(
    navbar = bs4DashNavbar(),
    sidebar = bs4DashSidebar(),
    controlbar = bs4DashControlbar(),
    footer = bs4DashFooter(),
    title = "test",
    body = bs4DashBody(
     bs4Card(
      title = "Timeline",
      bs4Timeline(
       width = 12,
       reversed = TRUE,
       bs4TimelineEnd(status = "danger"),
       bs4TimelineLabel("10 Feb. 2014", status = "info"),
       bs4TimelineItem(
        elevation = 4, 
        title = "Item 1",
        icon = "gears",
        status = "success",
        time = "now",
        footer = "Here is the footer",
        "This is the body"
       ),
       bs4TimelineItem(
        title = "Item 2",
        border = FALSE
       ),
       bs4TimelineLabel("3 Jan. 2014", status = "primary"),
       bs4TimelineItem(
        elevation = 2,
        title = "Item 3",
        icon = "paint-brush",
        status = "warning",
        bs4TimelineItemMedia(src = "http://placehold.it/150x100"),
        bs4TimelineItemMedia(src = "http://placehold.it/150x100")
       ),
       bs4TimelineStart(status = "danger")
      )
     )
    )
   ),
   server = function(input, output) {}
 )
}




