library(HARtools)


### Name: HARviewer-shiny
### Title: Shiny bindings for HARviewer
### Aliases: HARviewer-shiny HARviewerOutput renderHARviewer

### ** Examples

## Not run: 
##D library(shiny)
##D library(HARtools)
##D har <- readHAR(system.file(package = "HARtools", "exdata",
##D                            "r-project.org.161028_W2_11MA.har"))
##D hv <- HARviewer(har)
##D 
##D shinyApp(
##D   ui = fluidPage(
##D     HARviewerOutput("myHAR")
##D   ),
##D   server = function(input, output) {
##D     output$myHAR <- renderHARviewer(hv)
##D   }
##D )
## End(Not run)



