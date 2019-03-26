library(bs4Dash)


### Name: bs4Box
### Title: AdminLTE3 simple box
### Aliases: bs4Box

### ** Examples

if(interactive()){
 library(shiny)
 library(bs4Dash)
 
 shiny::shinyApp(
   ui = bs4DashPage(
     navbar = bs4DashNavbar(),
     sidebar = bs4DashSidebar(
      bs4SidebarMenu(
       bs4SidebarHeader("Main content"),
       bs4SidebarMenuItem(
         "Basic boxes",
         tabName = "boxes",
         icon = "desktop"
       )
      )
     ),
     controlbar = bs4DashControlbar(),
     footer = bs4DashFooter(),
     title = "test",
     body = bs4DashBody(
      bs4TabItems(
       bs4TabItem(
         tabName = "boxes",
         fluidRow(
          bs4Box(
           height = "600px",
           title = "Box 1",
           plotOutput("plot"),
           column(
            width = 12,
            align = "center",
            sliderInput(
              "obs",
              "Number of observations:",
              min = 0, max = 1000,
              value = 500
            )
           )
          ),
          bs4Box(
           height = "600px",
           title = "Box 2",
           plotOutput("distPlot"),
           column(
            width = 12,
            align = "center",
            radioButtons(
              "dist", 
              inline = TRUE,
              "Distribution type:",
              c("Norm" = "norm",
                "Unif" = "unif",
                "LogNorm" = "lnorm",
                "Exp" = "exp")
            )
           )
          )
         )
       )
      )
     )
   ),
   server = function(input, output) {
    output$plot <- renderPlot({
     hist(rnorm(input$obs))
     })
     
     output$distPlot <- renderPlot({
       dist <- switch(
       input$dist,
       norm = rnorm,
       unif = runif,
       lnorm = rlnorm,
       exp = rexp,
       rnorm
     )
       
       hist(dist(500))
     })
   }
 )
}




