library(shinybootstrap2)


### Name: navbarPage
### Title: Create a page with a top level navigation bar
### Aliases: navbarPage

### ** Examples

## Not run: 
##D navbarPage("App Title",
##D   tabPanel("Plot"),
##D   tabPanel("Summary"),
##D   tabPanel("Table")
##D )
##D 
##D navbarPage("App Title",
##D   tabPanel("Plot"),
##D   navbarMenu("More",
##D     tabPanel("Summary"),
##D     tabPanel("Table")
##D   )
##D )
## End(Not run)



