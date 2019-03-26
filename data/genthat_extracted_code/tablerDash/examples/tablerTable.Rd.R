library(tablerDash)


### Name: tablerTable
### Title: Create a Boostrap 4 table container
### Aliases: tablerTable

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
       tablerTable(
        title = "tablerTable",
        tablerTableItem(
         left = tablerTag(name = "Tag"),
         right = tablerTag(name = "Tag", href = "https://www.google.com")
        ),
        tablerTableItem(right = tablerStatus(color = "red")),
        tablerTableItem(
         left = tablerAvatarList(
          stacked = TRUE,
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
         )
       )
     )
   ),
   server = function(input, output) {}
 )
}




