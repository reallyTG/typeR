library(shiny)


### Name: onBookmark
### Title: Add callbacks for Shiny session bookmarking events
### Aliases: onBookmark onBookmarked onRestore onRestored

### ** Examples

## Only run these examples in interactive sessions
if (interactive()) {

# Basic use of onBookmark and onRestore: This app saves the time in its
# arbitrary values, and restores that time when the app is restored.
ui <- function(req) {
  fluidPage(
    textInput("txt", "Input text"),
    bookmarkButton()
  )
}
server <- function(input, output) {
  onBookmark(function(state) {
    savedTime <- as.character(Sys.time())
    cat("Last saved at", savedTime, "\n")
    # state is a mutable reference object, and we can add arbitrary values to
    # it.
    state$values$time <- savedTime
  })

  onRestore(function(state) {
    cat("Restoring from state bookmarked at", state$values$time, "\n")
  })
}
enableBookmarking("url")
shinyApp(ui, server)



ui <- function(req) {
  fluidPage(
    textInput("txt", "Input text"),
    bookmarkButton()
  )
}
server <- function(input, output, session) {
  lastUpdateTime <- NULL

  observeEvent(input$txt, {
    updateTextInput(session, "txt",
      label = paste0("Input text (Changed ", as.character(Sys.time()), ")")
    )
  })

  onBookmark(function(state) {
    # Save content to a file
    messageFile <- file.path(state$dir, "message.txt")
    cat(as.character(Sys.time()), file = messageFile)
  })

  onRestored(function(state) {
    # Read the file
    messageFile <- file.path(state$dir, "message.txt")
    timeText <- readChar(messageFile, 1000)

    # updateTextInput must be called in onRestored, as opposed to onRestore,
    # because onRestored happens after the client browser is ready.
    updateTextInput(session, "txt",
      label = paste0("Input text (Changed ", timeText, ")")
    )
  })
}
# "server" bookmarking is needed for writing to disk.
enableBookmarking("server")
shinyApp(ui, server)


# This app has a module, and both the module and the main app code have
# onBookmark and onRestore functions which write and read state$values$hash. The
# module's version of state$values$hash does not conflict with the app's version
# of state$values$hash.
#
# A basic module that captializes text.
capitalizerUI <- function(id) {
  ns <- NS(id)
  wellPanel(
    h4("Text captializer module"),
    textInput(ns("text"), "Enter text:"),
    verbatimTextOutput(ns("out"))
  )
}
capitalizerServer <- function(input, output, session) {
  output$out <- renderText({
    toupper(input$text)
  })
  onBookmark(function(state) {
    state$values$hash <- digest::digest(input$text, "md5")
  })
  onRestore(function(state) {
    if (identical(digest::digest(input$text, "md5"), state$values$hash)) {
      message("Module's input text matches hash ", state$values$hash)
    } else {
      message("Module's input text does not match hash ", state$values$hash)
    }
  })
}
# Main app code
ui <- function(request) {
  fluidPage(
    sidebarLayout(
      sidebarPanel(
        capitalizerUI("tc"),
        textInput("text", "Enter text (not in module):"),
        bookmarkButton()
      ),
      mainPanel()
    )
  )
}
server <- function(input, output, session) {
  callModule(capitalizerServer, "tc")
  onBookmark(function(state) {
    state$values$hash <- digest::digest(input$text, "md5")
  })
  onRestore(function(state) {
    if (identical(digest::digest(input$text, "md5"), state$values$hash)) {
      message("App's input text matches hash ", state$values$hash)
    } else {
      message("App's input text does not match hash ", state$values$hash)
    }
  })
}
enableBookmarking(store = "url")
shinyApp(ui, server)
}



