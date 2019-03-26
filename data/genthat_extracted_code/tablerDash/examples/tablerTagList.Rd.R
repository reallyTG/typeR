library(tablerDash)


### Name: tablerTagList
### Title: Create a Boostrap 4 tag list
### Aliases: tablerTagList

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
     tablerTagList(
      lapply(X = 1:5, FUN = function(i) {
       tablerTag(name = i)
      })
     )
    )
   ),
   server = function(input, output) {}
 )
}




