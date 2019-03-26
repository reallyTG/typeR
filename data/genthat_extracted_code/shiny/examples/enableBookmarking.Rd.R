library(shiny)


### Name: enableBookmarking
### Title: Enable bookmarking for a Shiny application
### Aliases: enableBookmarking

### ** Examples

## Only run these examples in interactive R sessions
if (interactive()) {

# Basic example with state encoded in URL
ui <- function(request) {
  fluidPage(
    textInput("txt", "Text"),
    checkboxInput("chk", "Checkbox"),
    bookmarkButton()
  )
}
server <- function(input, output, session) { }
enableBookmarking("url")
shinyApp(ui, server)


# An alternative to calling enableBookmarking(): use shinyApp's
# enableBookmarking argument
shinyApp(ui, server, enableBookmarking = "url")


# Same basic example with state saved to disk
enableBookmarking("server")
shinyApp(ui, server)


# Save/restore arbitrary values
ui <- function(req) {
  fluidPage(
    textInput("txt", "Text"),
    checkboxInput("chk", "Checkbox"),
    bookmarkButton(),
    br(),
    textOutput("lastSaved")
  )
}
server <- function(input, output, session) {
  vals <- reactiveValues(savedTime = NULL)
  output$lastSaved <- renderText({
    if (!is.null(vals$savedTime))
      paste("Last saved at", vals$savedTime)
    else
      ""
  })

  onBookmark(function(state) {
    vals$savedTime <- Sys.time()
    # state is a mutable reference object, and we can add arbitrary values
    # to it.
    state$values$time <- vals$savedTime
  })
  onRestore(function(state) {
    vals$savedTime <- state$values$time
  })
}
enableBookmarking(store = "url")
shinyApp(ui, server)


# Usable with dynamic UI (set the slider, then change the text input,
# click the bookmark button)
ui <- function(request) {
  fluidPage(
    sliderInput("slider", "Slider", 1, 100, 50),
    uiOutput("ui"),
    bookmarkButton()
  )
}
server <- function(input, output, session) {
  output$ui <- renderUI({
    textInput("txt", "Text", input$slider)
  })
}
enableBookmarking("url")
shinyApp(ui, server)


# Exclude specific inputs (The only input that will be saved in this
# example is chk)
ui <- function(request) {
  fluidPage(
    passwordInput("pw", "Password"), # Passwords are never saved
    sliderInput("slider", "Slider", 1, 100, 50), # Manually excluded below
    checkboxInput("chk", "Checkbox"),
    bookmarkButton()
  )
}
server <- function(input, output, session) {
  setBookmarkExclude("slider")
}
enableBookmarking("url")
shinyApp(ui, server)


# Update the browser's location bar every time an input changes. This should
# not be used with enableBookmarking("server"), because that would create a
# new saved state on disk every time the user changes an input.
ui <- function(req) {
  fluidPage(
    textInput("txt", "Text"),
    checkboxInput("chk", "Checkbox")
  )
}
server <- function(input, output, session) {
  observe({
    # Trigger this observer every time an input changes
    reactiveValuesToList(input)
    session$doBookmark()
  })
  onBookmarked(function(url) {
    updateQueryString(url)
  })
}
enableBookmarking("url")
shinyApp(ui, server)


# Save/restore uploaded files
ui <- function(request) {
  fluidPage(
    sidebarLayout(
      sidebarPanel(
        fileInput("file1", "Choose CSV File", multiple = TRUE,
          accept = c(
            "text/csv",
            "text/comma-separated-values,text/plain",
            ".csv"
          )
        ),
        tags$hr(),
        checkboxInput("header", "Header", TRUE),
        bookmarkButton()
      ),
      mainPanel(
        tableOutput("contents")
      )
    )
  )
}
server <- function(input, output) {
  output$contents <- renderTable({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)

    if (nrow(inFile) == 1) {
      read.csv(inFile$datapath, header = input$header)
    } else {
      data.frame(x = "multiple files")
    }
  })
}
enableBookmarking("server")
shinyApp(ui, server)

}



