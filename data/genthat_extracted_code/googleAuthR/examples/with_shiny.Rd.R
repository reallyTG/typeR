library(googleAuthR)


### Name: with_shiny
### Title: Turn a googleAuthR data fetch function into a Shiny compatible
###   one
### Aliases: with_shiny

### ** Examples

## Not run: 
##D ## in global.R
##D 
##D ## create the API call function, example with goo.gl URL shortner
##D library(googleAuthR)
##D options("googleAuthR.scopes.selected" = c("https://www.googleapis.com/auth/urlshortener"))
##D 
##D shorten_url <- function(url){
##D 
##D   body = list(
##D     longUrl = url
##D  )
##D  
##D  f <- gar_api_generator("https://www.googleapis.com/urlshortener/v1/url",
##D                         "POST",
##D                         data_parse_function = function(x) x$id)
##D                         
##D  f(the_body = body)
##D  
##D  }
##D 
##D 
##D ## in server.R
##D library(shiny)
##D library(googleAuthR)
##D source('global.R')
##D 
##D shinyServer(function(input, output, session)){
##D   
##D   ## Get auth code from return URL
##D   access_token  <- reactiveAccessToken(session)
##D 
##D   ## Make a loginButton to display using loginOutput
##D   output$loginButton <- renderLogin(session, access_token())
##D 
##D   short_url_output <- eventReactive(input$submit, {
##D   ## wrap existing function with_shiny
##D   ## pass the reactive token in shiny_access_token
##D   ## pass other named arguments
##D     short_url <- with_shiny(f = shorten_url, 
##D                            shiny_access_token = access_token(),
##D                            url=input$url)
##D                            
##D    })
##D    
##D    output$short_url <- renderText({
##D    
##D      short_url_output()
##D      
##D    })
##D  }
##D 
##D ## in ui.R
##D library(shiny)
##D library(googleAuthR)
##D 
##D shinyUI(
##D   fluidPage(
##D     loginOutput("loginButton"),
##D     textInput("url", "Enter URL"),
##D     actionButton("submit", "Shorten URL"),
##D     textOutput("short_url")
##D     ))
## End(Not run)



