library(tablerDash)


### Name: tablerTag
### Title: Create a Boostrap 4 tag
### Aliases: tablerTag

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
     tablerTag(name = "Tag"),
     tablerTag(name = "Tag", href = "https://www.google.com"),
     tablerTag(name = "Tag", rounded = TRUE, color = "pink"),
     tablerTag(
      name = "npm",
      href = "https://www.google.com",
      color = "dark",
      addon = "passing",
      addonColor = "warning"
     ),
     tablerTag(name = "build", addon = "passing", addonColor = "success")
    )
   ),
   server = function(input, output) {}
 )
}




