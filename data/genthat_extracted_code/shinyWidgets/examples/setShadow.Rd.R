library(shinyWidgets)


### Name: setShadow
### Title: Custom shadows
### Aliases: setShadow

### ** Examples

## Not run: 
##D  if (interactive()) {
##D 
##D   library(shiny)
##D   library(shinyWidgets)
##D   library(shinydashboard)
##D   library(shinydashboardPlus)
##D 
##D   ui <- fluidPage(
##D     tags$h2("Add shadow and hover interactions to any element"),
##D 
##D     setShadow("box"),
##D     setShadow("info-box"),
##D     setShadow("progress"),
##D     setBackgroundColor(color = "ghostwhite"),
##D     useShinydashboardPlus(),
##D 
##D     fluidRow(
##D      boxPlus(
##D        title = "Closable Box with dropdown",
##D        closable = TRUE,
##D        status = "warning",
##D        solidHeader = FALSE,
##D        collapsible = TRUE,
##D        enable_dropdown = TRUE,
##D        dropdown_icon = "wrench",
##D        dropdown_menu = dropdownItemList(
##D          dropdownItem(url = "http://www.google.com", name = "Link to google"),
##D          dropdownItem(url = "#", name = "item 2"),
##D          dropdownDivider(),
##D          dropdownItem(url = "#", name = "item 3")
##D        ),
##D        p("Box Content")
##D      ),
##D      boxPlus(
##D        title = "Closable box, with label",
##D        closable = TRUE,
##D        enable_label = TRUE,
##D        label_text = 1,
##D        label_status = "danger",
##D        status = "warning",
##D        solidHeader = FALSE,
##D        collapsible = TRUE,
##D        p("Box Content")
##D      )
##D     ),
##D     fluidRow(
##D      infoBox(
##D      "Orders",
##D      "50",
##D      "Subtitle", icon = icon("credit-card")
##D      )
##D     ),
##D     fluidRow(
##D      verticalProgress(
##D       value = 10,
##D       striped = TRUE,
##D       active = TRUE
##D      ),
##D      verticalProgress(
##D        value = 50,
##D        active = TRUE,
##D        status = "warning",
##D        size = "xs"
##D      ),
##D      verticalProgress(
##D        value = 20,
##D        status = "danger",
##D        size = "sm",
##D        height = "60%"
##D      )
##D     )
##D   )
##D   server <- function(input, output, session) {}
##D   shinyApp(ui, server)
##D  }
## End(Not run)



