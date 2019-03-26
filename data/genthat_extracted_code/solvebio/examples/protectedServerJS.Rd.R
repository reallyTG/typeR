library(solvebio)


### Name: protectedServerJS
### Title: protectedServerUI
### Aliases: protectedServerJS

### ** Examples

## Not run: 
##D jscookie_src <- "https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.0/js.cookie.js"
##D ui <- fluidPage(
##D     shiny::tags$head(
##D         shiny::tags$script(src = jscookie_src)
##D     ),
##D     useShinyjs(),
##D     extendShinyjs(text = solvebio::protectedServerJS(),
##D                   functions = c("enableCookieAuth", "getCookie", "setCookie", "rmCookie"))
##D )
## End(Not run)




