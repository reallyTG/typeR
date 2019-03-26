library(tablerDash)


### Name: tablerAvatar
### Title: Create a Boostrap 4 avatar
### Aliases: tablerAvatar

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
     tablerAvatar(
      name = "DG",
      size = "xxl"
     ),
     tablerAvatar(
      name = "DG",
      color = "orange"
     ),
     tablerAvatar(
      name = "DG",
      status = "warning"
     ),
     tablerAvatar(url = "https://image.flaticon.com/icons/svg/145/145852.svg")
    )
   ),
   server = function(input, output) {}
 )
}




