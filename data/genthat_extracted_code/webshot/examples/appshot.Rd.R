library(webshot)


### Name: appshot
### Title: Take a screenshot of a Shiny app
### Aliases: appshot appshot.character appshot.shiny.appobj

### ** Examples

if (interactive()) {
  appdir <- system.file("examples", "01_hello", package="shiny")

  # With a Shiny directory
  appshot(appdir, "01_hello.png")

  # With a Shiny App object
  shinyapp <- shiny::shinyAppDir(appdir)
  appshot(shinyapp, "01_hello_app.png")
}




