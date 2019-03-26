library(bs4Dash)


### Name: bs4Card
### Title: Create a Boostrap 4 card
### Aliases: bs4Card

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
    fluidRow(
     column(
      width = 6,
      bs4Card(
       title = "Closable Box with dropdown", 
       closable = TRUE, 
       width = 12,
       status = "warning", 
       solidHeader = FALSE, 
       collapsible = TRUE,
       labelText = 1,
       labelStatus = "danger",
       labelTooltip = "Hi Bro!",
       dropdownIcon = "wrench",
       dropdownMenu = dropdownItemList(
         dropdownItem(url = "http://www.google.com", name = "Link to google"),
         dropdownItem(url = "#", name = "item 2"),
         dropdownDivider(),
         dropdownItem(url = "#", name = "item 3")
       ),
       p("Box Content")
      )
     ),
     column(
      width = 6, 
      bs4Card(
       title = "Closable Box with gradient", 
       closable = TRUE, 
       width = 12,
       status = "warning", 
       solidHeader = FALSE, 
       gradientColor = "success",
       collapsible = TRUE,
       p("Box Content")
      )
     )
     ),
     bs4Card(
       title = "Closable Box with solidHeader", 
       closable = TRUE, 
       width = 6,
       solidHeader = TRUE, 
       status = "primary",
       collapsible = TRUE,
       p("Box Content")
      )
    )
   ),
   server = function(input, output) {}
 )
}




