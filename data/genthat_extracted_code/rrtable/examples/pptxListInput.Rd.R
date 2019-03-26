library(rrtable)


### Name: pptxListInput
### Title: UI of pptxList shiny module
### Aliases: pptxListInput

### ** Examples

library(shiny)
library(ggplot2)
library(editData)
library(moonBook)
library(readr)
if(interactive()){
ui=fluidPage(
    pptxListInput("pptxlist")
    )
server=function(input,output,session){
    mydf=callModule(pptxList,"pptxlist")
}
shinyApp(ui,server)
}



