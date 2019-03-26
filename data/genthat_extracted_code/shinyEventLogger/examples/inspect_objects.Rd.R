library(shinyEventLogger)


### Name: inspect_objects
### Title: Copying objects to global environment
### Aliases: inspect_objects

### ** Examples

if (interactive()) {

  set_logging()
  shiny::shinyApp(
    ui = shiny::fluidPage(log_init()),
    server = function(input, output) {
      set_logging_session()
      inspect_objects(mtcars)
      inspect_objects(df1 = head(mtcars), df2 = head(iris))
    }
  )

}



