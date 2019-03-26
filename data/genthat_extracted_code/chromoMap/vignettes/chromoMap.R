## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("chromoMap")
#  

## ------------------------------------------------------------------------
library(chromoMap)
data("pancandata")


## ------------------------------------------------------------------------
head(pancandata$data1,10)

## ------------------------------------------------------------------------
head(pancandata$data2,10)

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  chromoMap(pancandata$data1,type = "annotation")

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  chromoMap(pancandata$data1,type = "heatmap-single")

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  chromoMap(pancandata$data2,type = "heatmap-double")

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  chromoMap(pancandata$data1,type = "annotation",dim = c(450,400))

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  chromoMap(pancandata$data2,type = "heatmap-double",align = "vertical")

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  chromoMap(pancandata$data1,chCol = "blue",chBorder = "blue")

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  chromoMap(pancandata$data1,chCol = "white",chBorder = "green")

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  chromoMap(pancandata$data1,annoColor = "pink")

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  chromoMap(pancandata$data1,textCol = "green")

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  chromoMap(pancandata$data1,bgBorder  = "#FF5733")

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  chromoMap(pancandata$data2,type="heatmap-double",bgCol  = "black")

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  chromoMap(pancandata$data2,type="heatmap-double",HeatColRange = c("red","yellow","green"))

## ----eval=FALSE----------------------------------------------------------
#  library(chromoMap)
#  data("pancandata")
#  #use a variable to store your chromoMap
#  chmap = chromoMap(pancandata$data2,type="heatmap-double",HeatColRange = c("red","yellow","green"))
#  
#  #pass this to the function
#  chromoMapToHTML(chmap,file = "myfile.html",dir = "C:/Users/myfolder")
#  
#  #pass a title
#  chromoMapToHTML(chmap,title = "Expression profile Comparison in normal vs tumor",file = "myfile.html",dir = "C:/Users/myfolder")
#  
#  #pass a description
#  my_desc = "you can write a paragraph to describe your plot"
#  
#  chromoMapToHTML(chmap,title = "Expression profile Comparison in normal vs tumor",description = my_desc)
#  
#  #open document after save
#  chromoMapToHTML(chmap,title = "Expression profile Comparison in normal vs tumor",description = my_desc,openAfterSave = TRUE)
#  

## ----eval=FALSE----------------------------------------------------------
#  library(shiny)
#  library(chromoMap)
#  
#  # Define UI for application that draws chromoMap
#  ui <- fluidPage(
#  
#     # Application title
#     titlePanel("An example of chromoMap in Shiny"),
#  
#     # you can use GUI controls for your chromoMap
#     sidebarLayout(
#        sidebarPanel(
#           #some code
#        ),
#  
#        # Show a plot of the generated distribution
#        mainPanel(
#           chromoMapOutput("myChromoMap")
#        )
#     )
#  )
#  
#  # Define server logic required to draw chromoMap
#  server <- function(input, output) {
#  
#     output$myChromoMap <- renderChromoMap({
#       chromoMap(pancandata$data1,type = "annotation")
#     })
#  }
#  
#  # Run the application
#  shinyApp(ui = ui, server = server)
#  

