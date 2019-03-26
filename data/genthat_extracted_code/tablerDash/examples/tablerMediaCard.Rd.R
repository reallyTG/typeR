library(tablerDash)


### Name: tablerMediaCard
### Title: Create a Boostrap 4 media card
### Aliases: tablerMediaCard

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
     tablerMediaCard(
      title = "Media Card",
      date = "Today",
      href = "https://www.google.com",
      src = "https://preview.tabler.io/demo/photos/matt-barrett-339981-500.jpg",
      avatarUrl = "https://image.flaticon.com/icons/svg/145/145842.svg",
      width = 6
     )
    )
   ),
   server = function(input, output) {}
 )
}




