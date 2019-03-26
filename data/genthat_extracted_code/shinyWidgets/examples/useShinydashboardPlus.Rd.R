library(shinyWidgets)


### Name: useShinydashboardPlus
### Title: Use 'shinydashboardPlus' in 'shiny'
### Aliases: useShinydashboardPlus

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinydashboard)
##D library(shinydashboardPlus)
##D library(shinyWidgets)
##D 
##D 
##D # example taken from ?box
##D 
##D ui <- fluidPage(
##D   tags$h2("Classic shiny"),
##D 
##D   # use this in non shinydashboardPlus app
##D   useShinydashboardPlus(),
##D   setBackgroundColor(color = "ghostwhite"),
##D 
##D   # boxPlus
##D   fluidRow(
##D    boxPlus(
##D      title = "Closable Box with dropdown",
##D      closable = TRUE,
##D      status = "warning",
##D      solidHeader = FALSE,
##D      collapsible = TRUE,
##D      enable_dropdown = TRUE,
##D      dropdown_icon = "wrench",
##D      dropdown_menu = dropdownItemList(
##D        dropdownItem(url = "http://www.google.com", name = "Link to google"),
##D        dropdownItem(url = "#", name = "item 2"),
##D        dropdownDivider(),
##D        dropdownItem(url = "#", name = "item 3")
##D      ),
##D      p("Box Content")
##D    ),
##D    boxPlus(
##D      title = "Closable box, with label",
##D      closable = TRUE,
##D      enable_label = TRUE,
##D      label_text = 1,
##D      label_status = "danger",
##D      status = "warning",
##D      solidHeader = FALSE,
##D      collapsible = TRUE,
##D      p("Box Content")
##D    )
##D   ),
##D 
##D   br(),
##D 
##D   # gradientBoxes
##D   fluidRow(
##D     gradientBox(
##D      title = "My gradient Box",
##D      icon = "fa fa-th",
##D      gradientColor = "teal",
##D      boxToolSize = "sm",
##D      footer = column(
##D        width = 12,
##D        align = "center",
##D        sliderInput(
##D          "obs",
##D          "Number of observations:",
##D          min = 0, max = 1000, value = 500
##D        )
##D      ),
##D      plotOutput("distPlot")
##D     ),
##D     gradientBox(
##D      title = "My gradient Box",
##D      icon = "fa fa-heart",
##D      gradientColor = "maroon",
##D      boxToolSize = "xs",
##D      closable = TRUE,
##D      footer = "The footer goes here. You can include anything",
##D      "This is a gradient box"
##D     )
##D   ),
##D 
##D   br(),
##D 
##D   # extra elements
##D   fluidRow(
##D   column(
##D    width = 6,
##D    timelineBlock(
##D      reversed = FALSE,
##D      timelineEnd(color = "danger"),
##D      timelineLabel(2018, color = "teal"),
##D      timelineItem(
##D        title = "Item 1",
##D        icon = "gears",
##D        color = "olive",
##D        time = "now",
##D        footer = "Here is the footer",
##D        "This is the body"
##D      ),
##D      timelineItem(
##D        title = "Item 2",
##D        border = FALSE
##D      ),
##D      timelineLabel(2015, color = "orange"),
##D      timelineItem(
##D        title = "Item 3",
##D        icon = "paint-brush",
##D        color = "maroon",
##D        timelineItemMedia(src = "http://placehold.it/150x100"),
##D        timelineItemMedia(src = "http://placehold.it/150x100")
##D      ),
##D      timelineStart(color = "gray")
##D     )
##D    ),
##D   column(
##D    width = 6,
##D    box(
##D      title = "Box with boxPad containing inputs",
##D      status = "warning",
##D      width = 12,
##D      fluidRow(
##D        column(
##D          width = 6,
##D          boxPad(
##D            color = "gray",
##D            sliderInput(
##D              "obs2",
##D              "Number of observations:",
##D              min = 0, max = 1000, value = 500
##D            ),
##D            checkboxGroupInput(
##D              "variable",
##D              "Variables to show:",
##D              c(
##D                "Cylinders" = "cyl",
##D                "Transmission" = "am",
##D                "Gears" = "gear"
##D              )
##D            ),
##D 
##D            knobInput(
##D              inputId = "myKnob",
##D              skin = "tron",
##D              readOnly = TRUE,
##D              label = "Display previous:",
##D              value = 50,
##D              min = -100,
##D              displayPrevious = TRUE,
##D              fgColor = "#428BCA",
##D              inputColor = "#428BCA"
##D            )
##D          )
##D        ),
##D        column(
##D          width = 6,
##D          plotOutput("distPlot2", height = "200px"),
##D          tableOutput("data")
##D        )
##D      )
##D     )
##D    )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$distPlot <- renderPlot({
##D    hist(rnorm(input$obs))
##D   })
##D 
##D   output$distPlot2 <- renderPlot({
##D     hist(rnorm(input$obs2))
##D   })
##D 
##D   output$data <- renderTable({
##D     head(mtcars[, c("mpg", input$variable), drop = FALSE])
##D   }, rownames = TRUE)
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



