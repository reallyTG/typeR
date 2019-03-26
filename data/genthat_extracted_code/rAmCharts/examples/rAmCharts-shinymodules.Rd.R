library(rAmCharts)


### Name: rAmCharts-shinymodules
### Title: Shiny module to export rAmCharts graphics on server-side
### Aliases: rAmCharts-shinymodules rAmChartsExportServerUI
###   rAmChartsExportServer

### ** Examples


## Not run: 
##D 
##D # ui
##D rAmChartsExportServerUI("export_server_graphs")
##D 
##D # server
##D 
##D mult_amgraph <- reactive({
##D  if(input$goSave > 0){
##D    isolate({
##D      list(
##D        list(graph = amPie(data = data_pie), name = "pie.jpg", height = "200px", width = "300px"),
##D        list(graph = amBarplot(x = "country", y = "visits", data = data_bar, main = "example") %>%
##D          setExport(), name = "bar.jpg", height = "600px")
##D      )
##D    })
##D  } else {
##D    NULL
##D  }
##D })
##D 
##D 
##D callModule(rAmChartsExportServer, "export_server_graphs", mult_amgraph, 
##D           reactive("/home/benoit/amchart_export"))
##D 
## End(Not run)



