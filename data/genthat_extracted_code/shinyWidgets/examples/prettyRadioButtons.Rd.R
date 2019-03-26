library(shinyWidgets)


### Name: prettyRadioButtons
### Title: Pretty radio Buttons Input Control
### Aliases: prettyRadioButtons

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h1("Pretty radio buttons"),
##D   br(),
##D 
##D   fluidRow(
##D     column(
##D       width = 4,
##D       prettyRadioButtons(inputId = "radio1",
##D                           label = "Click me!",
##D                           choices = c("Click me !", "Me !", "Or me !")),
##D       verbatimTextOutput(outputId = "res1"),
##D       br(),
##D       prettyRadioButtons(inputId = "radio4",  label = "Click me!",
##D                           choices = c("Click me !", "Me !", "Or me !"),
##D                           outline = TRUE,
##D                           plain = TRUE, icon = icon("thumbs-up")),
##D       verbatimTextOutput(outputId = "res4")
##D     ),
##D     column(
##D       width = 4,
##D       prettyRadioButtons(inputId = "radio2",
##D                           label = "Click me!", thick = TRUE,
##D                           choices = c("Click me !", "Me !", "Or me !"),
##D                           animation = "pulse", status = "info"),
##D       verbatimTextOutput(outputId = "res2"),
##D       br(),
##D       prettyRadioButtons(inputId = "radio5",
##D                           label = "Click me!", icon = icon("check"),
##D                           choices = c("Click me !", "Me !", "Or me !"),
##D                           animation = "tada", status = "default"),
##D       verbatimTextOutput(outputId = "res5")
##D     ),
##D     column(
##D       width = 4,
##D       prettyRadioButtons(inputId = "radio3",  label = "Click me!",
##D                           choices = c("Click me !", "Me !", "Or me !"),
##D                           shape = "round", status = "danger",
##D                           fill = TRUE, inline = TRUE),
##D       verbatimTextOutput(outputId = "res3")
##D     )
##D   )
##D 
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res1 <- renderPrint(input$radio1)
##D   output$res2 <- renderPrint(input$radio2)
##D   output$res3 <- renderPrint(input$radio3)
##D   output$res4 <- renderPrint(input$radio4)
##D   output$res5 <- renderPrint(input$radio5)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



