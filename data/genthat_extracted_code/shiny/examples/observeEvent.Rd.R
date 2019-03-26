library(shiny)


### Name: observeEvent
### Title: Event handler
### Aliases: observeEvent eventReactive

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {

  ## App 1: Sample usage
  shinyApp(
    ui = fluidPage(
      column(4,
        numericInput("x", "Value", 5),
        br(),
        actionButton("button", "Show")
      ),
      column(8, tableOutput("table"))
    ),
    server = function(input, output) {
      # Take an action every time button is pressed;
      # here, we just print a message to the console
      observeEvent(input$button, {
        cat("Showing", input$x, "rows\n")
      })
      # Take a reactive dependency on input$button, but
      # not on any of the stuff inside the function
      df <- eventReactive(input$button, {
        head(cars, input$x)
      })
      output$table <- renderTable({
        df()
      })
    }
  )

  ## App 2: Using `once`
  shinyApp(
    ui = basicPage( actionButton("go", "Go")),
    server = function(input, output, session) {
      observeEvent(input$go, {
        print(paste("This will only be printed once; all",
              "subsequent button clicks won't do anything"))
      }, once = TRUE)
    }
  )

  ## App 3: Using `ignoreInit` and `once`
  shinyApp(
    ui = basicPage(actionButton("go", "Go")),
    server = function(input, output, session) {
      observeEvent(input$go, {
        insertUI("#go", "afterEnd",
                 actionButton("dynamic", "click to remove"))

        # set up an observer that depends on the dynamic
        # input, so that it doesn't run when the input is
        # created, and only runs once after that (since
        # the side effect is remove the input from the DOM)
        observeEvent(input$dynamic, {
          removeUI("#dynamic")
        }, ignoreInit = TRUE, once = TRUE)
      })
    }
  )
}



