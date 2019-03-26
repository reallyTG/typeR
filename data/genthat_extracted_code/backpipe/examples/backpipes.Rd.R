library(backpipe)


### Name: %<%
### Title: backpipes: %<%, %<<%
### Aliases: %<% %<<%

### ** Examples

  ## Not run: 
##D     require(magrittr)
##D     letters %>% paste0( 1:26 )  # forward pipe
##D     paste0( 1:26 ) %<% letters  # backward pipe
##D 
##D     mean %<% range( na.rm = TRUE ) %<% c(1:5, NA)
##D   
## End(Not run)
  
  ## Not run: 
##D     require(pipeR)
##D     letters %>>% paste0( 1:26 )  # forward pipe
##D     paste0( 1:26 ) %<<% letters  # backward pipe
##D 
##D     mean %<<% range( na.rm = TRUE ) %<<% c(1:5, NA)
##D   
## End(Not run)
  
  ## Not run: 
##D     require(shiny)
##D     div( class="outer-outer") %<%
##D       div( class="outer")     %<% 
##D         div( class="inner")   %<% 
##D           h1( "content", role="heading" )
##D    
## End(Not run)          




