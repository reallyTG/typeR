library(auth0)


### Name: auth0_logout_url
### Title: Generate logout URL
### Aliases: auth0_logout_url

### ** Examples

## No test: 
library(shiny)
library(auth0)
library(shinyjs)
# simple UI with action button
# note that you must include shinyjs::useShinyjs() for this to work
ui <- fluidPage(shinyjs::useShinyjs(), actionButton("logout_auth0", "Logout"))

# server with one observer that logouts
server <- function(input, output, session) {
  observeEvent(input$logout_auth0, {
    # javascript code redirecting to correct url
    js <- auth0_logout_url()
    shinyjs::runjs(js)
  })
}

shinyAuth0App(ui, server, config_file = config_file)
## End(No test)




