library(shinythemes)


### Name: themeSelector
### Title: Add a theme selector widget in a floating panel
### Aliases: themeSelector

### ** Examples


if (interactive()) {
# themeSelector can be inserted anywhere in the app.
shinyApp(
  ui = fluidPage(
    shinythemes::themeSelector(),
    sidebarPanel(
      textInput("txt", "Text input:", "text here"),
      sliderInput("slider", "Slider input:", 1, 100, 30),
      actionButton("action", "Button"),
      actionButton("action2", "Button2", class = "btn-primary")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Tab 1"),
        tabPanel("Tab 2")
      )
    )
  ),
  server = function(input, output) {}
)


# If this is used with a navbarPage() or other type of page where there is not a
# good place to put it where it is outside of all tabs, you can wrap the entire
# page in tagList() and make the themeSelector a sibling of the page.
shinyApp(
  ui = tagList(
    shinythemes::themeSelector(),
    navbarPage(
      "Theme test",
      tabPanel("Navbar 1",
        sidebarPanel(
          textInput("txt", "Text input:", "text here"),
          sliderInput("slider", "Slider input:", 1, 100, 30),
          actionButton("action", "Button"),
          actionButton("action2", "Button2", class = "btn-primary")
        ),
        mainPanel(
          tabsetPanel(
            tabPanel("Tab 1"),
            tabPanel("Tab 2")
          )
        )
      ),
      tabPanel("Navbar 2")
    )
  ),
  server = function(input, output) {}
)
}



