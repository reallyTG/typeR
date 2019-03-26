library(tablerDash)


### Name: tablerBlogCard
### Title: Create a Boostrap 4 blog card
### Aliases: tablerBlogCard

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
     tablerBlogCard(
      title = "Blog Card",
      author = "David",
      date = "Today",
      href = "https://www.google.com",
      src = "https://preview.tabler.io/demo/photos/matt-barrett-339981-500.jpg",
      avatarUrl = "https://image.flaticon.com/icons/svg/145/145842.svg",
      width = 6,
      "Look, my liege! The Knights Who Say Ni
      demand a sacrifice! …Are you suggesting
      that coconuts migr..."
     )
    )
   ),
   server = function(input, output) {}
 )
}




