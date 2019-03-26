library(googleAuthR)


### Name: googleAuth
### Title: Shiny Google Authorisation [Server Module]
### Aliases: googleAuth

### ** Examples


## Not run: 
##D options("googleAuthR.scopes.selected" = 
##D   c("https://www.googleapis.com/auth/urlshortener"))
##D 
##D shorten_url <- function(url){
##D   body = list(
##D     longUrl = url
##D  )
##D  
##D  f <- 
##D    gar_api_generator("https://www.googleapis.com/urlshortener/v1/url",
##D                      "POST",
##D                      data_parse_function = function(x) x$id)
##D                         
##D  f(the_body = body)
##D  
##D  }
##D 
##D server <- function(input, output, session){
##D 
##D   ## Create access token and render login button
##D   access_token <- callModule(googleAuth, 
##D                              "loginButton",
##D                              login_text = "Login1")
##D 
##D   short_url_output <- eventReactive(input$submit, {
##D     ## wrap existing function with_shiny
##D     ## pass the reactive token in shiny_access_token
##D     ## pass other named arguments
##D     with_shiny(f = shorten_url, 
##D                shiny_access_token = access_token(),
##D                url=input$url)
##D   })
##D 
##D   output$short_url <- renderText({
##D 
##D     short_url_output()
##D 
##D   })
##D 
##D }
##D 
##D ## ui
##D ui <- fluidPage(
##D   googleAuthUI("loginButton"),
##D   textInput("url", "Enter URL"),
##D   actionButton("submit", "Shorten URL"),
##D   textOutput("short_url")
##D )
##D 
##D shinyApp(ui = ui, server = server)
## End(Not run)




