library(tablerDash)


### Name: tablerTimeline
### Title: Create a Boostrap 4 timeline
### Aliases: tablerTimeline

### ** Examples

if(interactive()){
 library(shiny)
 library(tablerDash)

 shiny::shinyApp(
   ui = tablerDashPage(
    navbar = NULL,
    footer = NULL,
    title = "test",
    body = tablerDashBody(
     tablerTimeline(
      tablerTimelineItem(
       title = "Item 1",
       status = "green",
       date = "now"
      ),
      tablerTimelineItem(
       title = "Item 2",
       status = NULL,
       date = "yesterday",
       "Lorem ipsum dolor sit amet,
       consectetur adipisicing elit."
      )
     )
    )
   ),
   server = function(input, output) {}
 )
}




