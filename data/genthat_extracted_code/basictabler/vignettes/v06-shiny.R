## ---- message=FALSE, warning=FALSE, eval=FALSE---------------------------
#  library(shiny)
#  library(htmlwidgets)
#  library(dplyr)
#  library(basictabler)
#  
#  ui <- fluidPage(
#  
#     titlePanel("Basictabler Minimal Example Shiny App"),
#  
#     sidebarLayout(
#        sidebarPanel(
#  
#           selectInput("groupBy", label = h5("Rows"),
#                       choices = list("Train Category" = "TrainCategory",
#                                      "TOC" = "TOC",
#                                      "Power Type" = "PowerType"), selected = "TOC")
#        ),
#  
#        mainPanel(
#           basictablerOutput('tbl')
#        )
#     )
#  )
#  
#  server <- function(input, output) {
#  
#     output$tbl <- renderBasictabler({
#  
#       tocsummary <- bhmsummary %>%
#         group_by_(input$groupBy) %>%
#         summarise(OnTimeArrivals=sum(OnTimeArrivals),
#                  OnTimeDepartures=sum(OnTimeDepartures),
#                  TotalTrains=sum(TrainCount)) %>%
#         ungroup() %>%
#         mutate(OnTimeArrivalPercent=OnTimeArrivals/TotalTrains*100,
#               OnTimeDeparturePercent=OnTimeDepartures/TotalTrains*100) %>%
#         arrange_(input$groupBy)
#  
#       # formatting values (explained in the introduction vignette)
#       columnFormats=list(NULL, list(big.mark=","), list(big.mark=","), list(big.mark=","), "%.1f", "%.1f")
#  
#       # create the table and render
#       tbl <- BasicTable$new()
#       tbl$addData(tocsummary, firstColumnAsRowHeaders=TRUE,
#                  explicitColumnHeaders=c(input$groupBy, "On-Time Arrivals", "On-Time Departures",
#                                          "Total Trains", "On-Time Arrival %", "On-Time Departure %"),
#                  columnFormats=columnFormats)
#  
#       basictabler(tbl)
#     })
#  }
#  
#  shinyApp(ui = ui, server = server)

