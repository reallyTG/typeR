library(crosstalk)


### Name: ClientValue
### Title: ClientValue object
### Aliases: ClientValue
### Keywords: datasets

### ** Examples

library(shiny)

server <- function(input, output, session) {
  cv <- ClientValue$new("var1", "group1")

  r <- reactive({
    # Don't proceed unless cv$get() is a non-NULL value
    validate(need(cv$get(), message = FALSE))

    runif(cv$get())
  })

  observeEvent(input$click, {
    cv$sendUpdate(NULL)
  })
}




