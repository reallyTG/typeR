library(shiny)


### Name: insertTab
### Title: Dynamically insert/remove a tabPanel
### Aliases: insertTab prependTab appendTab removeTab

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {

# example app for inserting/removing a tab
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      actionButton("add", "Add 'Dynamic' tab"),
      actionButton("remove", "Remove 'Foo' tab")
    ),
    mainPanel(
      tabsetPanel(id = "tabs",
        tabPanel("Hello", "This is the hello tab"),
        tabPanel("Foo", "This is the foo tab"),
        tabPanel("Bar", "This is the bar tab")
      )
    )
  )
)
server <- function(input, output, session) {
  observeEvent(input$add, {
    insertTab(inputId = "tabs",
      tabPanel("Dynamic", "This a dynamically-added tab"),
      target = "Bar"
    )
  })
  observeEvent(input$remove, {
    removeTab(inputId = "tabs", target = "Foo")
  })
}

shinyApp(ui, server)


# example app for prepending/appending a navbarMenu
ui <- navbarPage("Navbar page", id = "tabs",
  tabPanel("Home",
    actionButton("prepend", "Prepend a navbarMenu"),
    actionButton("append", "Append a navbarMenu")
  )
)
server <- function(input, output, session) {
  observeEvent(input$prepend, {
    id <- paste0("Dropdown", input$prepend, "p")
    prependTab(inputId = "tabs",
      navbarMenu(id,
        tabPanel("Drop1", paste("Drop1 page from", id)),
        tabPanel("Drop2", paste("Drop2 page from", id)),
        "------",
        "Header",
        tabPanel("Drop3", paste("Drop3 page from", id))
      )
    )
  })
  observeEvent(input$append, {
    id <- paste0("Dropdown", input$append, "a")
    appendTab(inputId = "tabs",
      navbarMenu(id,
        tabPanel("Drop1", paste("Drop1 page from", id)),
        tabPanel("Drop2", paste("Drop2 page from", id)),
        "------",
        "Header",
        tabPanel("Drop3", paste("Drop3 page from", id))
      )
    )
  })
}

shinyApp(ui, server)

}



