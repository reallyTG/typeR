library(googleAuthR)


### Name: gar_shiny_auth
### Title: Create Authentication within Shiny's server.R
### Aliases: gar_shiny_auth

### ** Examples


## Not run: 
##D library(shiny)
##D library(googleAuthR)
##D gar_set_client()
##D 
##D fileSearch <- function(query) {
##D   googleAuthR::gar_api_generator("https://www.googleapis.com/drive/v3/files/",
##D                                 "GET",
##D                                 pars_args=list(q=query),
##D                                 data_parse_function = function(x) x$files)()
##D }
##D 
##D ## ui.R
##D ui <- fluidPage(title = "googleAuthR Shiny Demo",
##D                 textInput("query", 
##D                 label = "Google Drive query", 
##D                 value = "mimeType != 'application/vnd.google-apps.folder'"),
##D                 tableOutput("gdrive")
##D                 )
##D                 
##D ## server.R
##D server <- function(input, output, session){
##D 
##D # this is not reactive, no need as you only reach here authenticated
##D gar_shiny_auth(session)
##D 
##D output$gdrive <- renderTable({
##D   req(input$query)
##D   
##D   # no need for with_shiny()
##D   fileSearch(input$query)
##D   
##D   })
##D   }
##D 
##D # gar_shiny_ui() needs to wrap the ui you have created above.
##D shinyApp(gar_shiny_ui(ui), server)
## End(Not run)



