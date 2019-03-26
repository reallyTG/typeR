library(shinyBS)


### Name: Tooltips_and_Popovers
### Title: Tooltips and Popovers
### Aliases: Tooltips_and_Popovers

### ** Examples

library(shiny)
library(shinyBS)

app = shinyApp(
 ui =
 fluidPage(
   sidebarLayout(
     sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30),
       bsTooltip("bins", "The wait times will be broken into this many equally spaced bins",
         "right", options = list(container = "body"))
     ),
     mainPanel(
       plotOutput("distPlot"),
       uiOutput("uiExample")
     )
   )
 ),
 server =
 function(input, output, session) {
   output$distPlot <- renderPlot({

     # generate bins based on input$bins from ui.R
     x    <- faithful[, 2]
     bins <- seq(min(x), max(x), length.out = input$bins + 1)

     # draw the histogram with the specified number of bins
     hist(x, breaks = bins, col = 'darkgray', border = 'white')

   })
   output$uiExample <- renderUI({
     tags$span(
       popify(bsButton("pointlessButton", "Button", style = "primary", size = "large"),
         "A Pointless Button",
         "This button is <b>pointless</b>. It does not do <em>anything</em>!"),
       tipify(bsButton("pB2", "Button", style = "inverse", size = "extra-small"),
         "This button is pointless too!")
     )
   })
   addPopover(session, "distPlot", "Data", content = paste0("<p>Waiting time between ",
     "eruptions and the duration of the eruption for the Old Faithful geyser ",
     "in Yellowstone National Park, Wyoming, USA.</p><p>Azzalini, A. and ",
     "Bowman, A. W. (1990). A look at some data on the Old Faithful geyser. ",
     "Applied Statistics 39, 357-365.</p>"), trigger = 'click')
 }
)
## Not run: 
##D  runApp(app)
## End(Not run)



