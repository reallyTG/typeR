library(shiny.semantic)


### Name: search_field
### Title: Create search field Semantic UI component
### Aliases: search_field

### ** Examples

## Only run examples in interactive R sessions
## Not run: 
##D if (interactive()) {
##D library(shiny)
##D library(shiny.semantic)
##D library(gapminder)
##D library(dplyr)
##D 
##D ui <- function() {
##D   shinyUI(
##D     semanticPage(
##D       title = "Dropdown example",
##D       uiOutput("search_letters"),
##D       p("Selected letter:"),
##D       textOutput("selected_letters")
##D    )
##D   )
##D }
##D 
##D server <- shinyServer(function(input, output, session) {
##D 
##D  search_api <- function(gapminder, q){
##D    has_matching <- function(field) {
##D      startsWith(field, q)
##D    }
##D    gapminder %>%
##D      mutate(country = as.character(country)) %>%
##D      select(country) %>%
##D      unique %>%
##D      filter(has_matching(country)) %>%
##D      head(5) %>%
##D      transmute(title = country,
##D                description = country)
##D  }
##D 
##D  search_api_url <- register_search(session, gapminder, search_api)
##D  output$search_letters <- shiny::renderUI(
##D    search_field("search_result", search_api_url)
##D  )
##D  output$selected_letters <- renderText(input[["search_result"]])
##D })
##D }
##D 
##D shinyApp(ui = ui(), server = server)
## End(Not run)



