library(shiny)


### Name: onStop
### Title: Run code after an application or session ends
### Aliases: onStop

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
  # Open this application in multiple browsers, then close the browsers.
  shinyApp(
    ui = basicPage("onStop demo"),

    server = function(input, output, session) {
      onStop(function() cat("Session stopped\n"))
    },

    onStart = function() {
      cat("Doing application setup\n")

      onStop(function() {
        cat("Doing application cleanup\n")
      })
    }
  )
}
# In the example above, onStop() is called inside of onStart(). This is
# the pattern that should be used when creating a shinyApp() object from
# a function, or at the console. If instead you are writing an app.R which
# will be invoked with runApp(), you can do it that way, or put the onStop()
# before the shinyApp() call, as shown below.

## Not run: 
##D # ==== app.R ====
##D cat("Doing application setup\n")
##D onStop(function() {
##D   cat("Doing application cleanup\n")
##D })
##D 
##D shinyApp(
##D   ui = basicPage("onStop demo"),
##D 
##D   server = function(input, output, session) {
##D     onStop(function() cat("Session stopped\n"))
##D   }
##D )
##D # ==== end app.R ====
##D 
##D 
##D # Similarly, if you have a global.R, you can call onStop() from there.
##D # ==== global.R ====
##D cat("Doing application setup\n")
##D onStop(function() {
##D   cat("Doing application cleanup\n")
##D })
##D # ==== end global.R ====
## End(Not run)



