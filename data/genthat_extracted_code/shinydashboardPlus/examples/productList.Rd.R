library(shinydashboardPlus)


### Name: productList
### Title: AdminLTE2 product list container
### Aliases: productList

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
      title = "Product List",
      status = "primary",
      productList(
        productListItem(
          src = "http://www.pngmart.com/files/1/Haier-TV-PNG.png", 
          productTitle = "Samsung TV", 
          productPrice = "$1800", 
          priceColor = "warning",
          "This is an amazing TV, but I don't like TV!"
        ),
        productListItem(
          src = "http://icon-park.com/imagefiles/imac.png", 
          productTitle = "Imac 27", 
          productPrice = "$2400", 
          priceColor = "danger",
          "This is were I spend most of my time!"
        )
      )
     )
    ),
    title = "Product List"
  ),
  server = function(input, output) { }
 )
}




