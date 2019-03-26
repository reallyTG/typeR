library(ggplotAssist)


### Name: textFunctionInput
### Title: UI of textFunction shiny module
### Aliases: textFunctionInput

### ** Examples

library(ggplotAssist)
library(shiny)
# Only run examples in interactive R sessions
if(interactive()){
ui=fluidPage(
   textFunctionInput("text"),
   textOutput("text")
)
server=function(input,output,session){
   rv=reactiveValues()
   rawData=read.csv("data-raw/setting.csv",stringsAsFactors = FALSE)
   settingData=splitData(rawData,"setting")
   rv$argList<-list(label="text",mode="text",value="element_text()",choices=NULL,width=200,
                    bg="lightcyan",placeholder="")
   result=callModule(textFunction,"text",argList=reactive(rv$argList),
                     editCode=reactive(TRUE),settingData=reactive(settingData))
   output$text=renderText({
       result()
   })
}
shinyApp(ui,server)
}



