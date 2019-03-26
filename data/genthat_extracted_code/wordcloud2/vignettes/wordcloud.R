## ----eval = F------------------------------------------------------------
#  require(devtools)
#  install_github("lchiffon/wordcloud2")

## ------------------------------------------------------------------------
library(wordcloud2)
wordcloud2(data = demoFreq)

## ------------------------------------------------------------------------
head(demoFreq)

## ----eval = F------------------------------------------------------------
#  wordcloud2(demoFreq, color = "random-light", backgroundColor = "grey")

## ------------------------------------------------------------------------
wordcloud2(demoFreq, minRotation = -pi/6, maxRotation = -pi/6, minSize = 10,
  rotateRatio = 1)

## ----eval = F------------------------------------------------------------
#  figPath = system.file("examples/t.png",package = "wordcloud2")
#  wordcloud2(demoFreq, figPath = figPath, size = 1.5,color = "skyblue")

## ------------------------------------------------------------------------
letterCloud(demoFreq, word = "R", size = 2)

## ------------------------------------------------------------------------
letterCloud(demoFreq, word = "WORDCLOUD2", wordSize = 1)

## ----eval= F-------------------------------------------------------------
#  if(require(shiny)){
#    library(wordcloud2)
#     # Global variables can go here
#     n <- 1
#  
#     # Define the UI
#     ui <- bootstrapPage(
#        numericInput('size', 'Size of wordcloud', n),
#       wordcloud2Output('wordcloud2')
#     )
#  
#  
#     # Define the server code
#     server <- function(input, output) {
#        output$wordcloud2 <- renderWordcloud2({
#        # wordcloud2(demoFreqC, size=input$size)
#          wordcloud2(demoFreq, size=input$size)
#        })
#     }
#     # Return a Shiny app object
#     # Sys.setlocale("LC_CTYPE","chs") #if you use Chinese character
#     ## Do not Run!
#     shinyApp(ui = ui, server = server)
#     }

