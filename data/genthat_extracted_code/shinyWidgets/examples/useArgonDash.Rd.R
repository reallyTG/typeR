library(shinyWidgets)


### Name: useArgonDash
### Title: Use 'argonDash' in 'shiny'
### Aliases: useArgonDash

### ** Examples

## Not run: 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(argonR)
##D library(argonDash)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   h1("Import argonDash elements inside shiny!", align = "center"),
##D   h5("Don't need any sidebar, navbar, ...", align = "center"),
##D   h5("Only focus on basic elements for a pure interface", align = "center"),
##D 
##D   # use this in non dashboard app
##D   setBackgroundColor(color = "ghostwhite"),
##D   useArgonDash(),
##D 
##D   fluidRow(
##D    column(
##D     width = 6,
##D      argonCard(
##D      status = "primary",
##D      width = 12,
##D      title = "Card 1",
##D      hover_lift = TRUE,
##D      shadow = TRUE,
##D      icon = "check-bold",
##D      src = "#",
##D      "Argon is a great free UI package based on Bootstrap 4
##D        that includes the most important components and features."
##D     )
##D    ),
##D    column(
##D     width = 6,
##D     argonTabSet(
##D      id = "tab-1",
##D      card_wrapper = TRUE,
##D      horizontal = TRUE,
##D      circle = FALSE,
##D      size = "sm",
##D      width = 6,
##D      iconList = list("cloud-upload-96", "bell-55", "calendar-grid-58"),
##D      argonTab(
##D        tabName = "Tab 1",
##D        active = TRUE,
##D        sliderInput(
##D         "number",
##D         "Number of observations:",
##D         min = 0,
##D         max = 100,
##D         value = 50
##D        ),
##D        uiOutput("progress")
##D      ),
##D      argonTab(
##D        tabName = "Tab 2",
##D        active = FALSE,
##D        prettyRadioButtons(
##D         inputId = "dist",
##D         inline = TRUE,
##D         animation = "pulse",
##D         label = "Distribution type:",
##D         c("Normal" = "norm",
##D          "Uniform" = "unif",
##D          "Log-normal" = "lnorm",
##D          "Exponential" = "exp")
##D         ),
##D         plotOutput("distPlot")
##D      ),
##D      argonTab(
##D        tabName = "Tab 3",
##D        active = FALSE,
##D        numericInput("valueBox", "Second value box:", 10, min = 1, max = 100)
##D      )
##D     )
##D    )
##D   ),
##D   br(),
##D   fluidRow(
##D    argonInfoCard(
##D     value = "350,897",
##D     title = "TRAFFIC",
##D     stat = 3.48,
##D     stat_icon = "arrow-up",
##D     description = "Since last month",
##D     icon = "chart-bar",
##D     icon_background = "danger",
##D     hover_lift = TRUE
##D    ),
##D    argonInfoCard(
##D      value = textOutput("value"),
##D      title = "NEW USERS",
##D      stat = -3.48,
##D      stat_icon = "arrow-down",
##D      description = "Since last week",
##D      icon = "chart-pie",
##D      icon_background = "warning",
##D      shadow = TRUE
##D    ),
##D    argonInfoCard(
##D      value = "924",
##D      title = "SALES",
##D      stat = -1.10,
##D      stat_icon = "arrow-down",
##D      description = "Since yesterday",
##D      icon = "users",
##D      icon_background = "yellow",
##D      background_color = "default"
##D    ),
##D    argonInfoCard(
##D      value = "49,65%",
##D      title = "PERFORMANCE",
##D      stat = 12,
##D      stat_icon = "arrow-up",
##D      description = "Since last month",
##D      icon = "percent",
##D      icon_background = "info",
##D      gradient = TRUE,
##D      background_color = "orange",
##D      hover_lift = TRUE
##D    )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D  output$progress <- renderUI({
##D   argonProgress(value = input$number, status = "danger", text = "Custom Text")
##D  })
##D 
##D  output$distPlot <- renderPlot({
##D   dist <- switch(input$dist,
##D                  norm = rnorm,
##D                  unif = runif,
##D                  lnorm = rlnorm,
##D                  exp = rexp,
##D                  rnorm)
##D 
##D   hist(dist(500))
##D  })
##D 
##D  output$value <- renderText(input$valueBox)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
## End(Not run)



