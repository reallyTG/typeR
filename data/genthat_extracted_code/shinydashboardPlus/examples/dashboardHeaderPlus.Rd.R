library(shinydashboardPlus)


### Name: dashboardHeaderPlus
### Title: Create a header for a dashboard page
### Aliases: dashboardHeaderPlus

### ** Examples

if (interactive()) {
 library(shiny)
 library(shinyWidgets)
 library(shinydashboard)
 library(shinydashboardPlus)
 
 shinyApp(
  ui = dashboardPagePlus(
    header = dashboardHeaderPlus(
      enable_rightsidebar = TRUE,
      rightSidebarIcon = "gears",
      left_menu = tagList(
        dropdownBlock(
          id = "mydropdown",
          title = "Dropdown 1",
          icon = "sliders",
          sliderInput(
            inputId = "n",
            label = "Number of observations",
            min = 10, max = 100, value = 30
          ),
          prettyToggle(
            inputId = "na",
            label_on = "NAs keeped",
            label_off = "NAs removed",
            icon_on = icon("check"),
            icon_off = icon("remove")
          )
        ),
        dropdownBlock(
          id = "mydropdown2",
          title = "Dropdown 2",
          icon = "sliders",
          prettySwitch(
            inputId = "switch4",
            label = "Fill switch with status:",
            fill = TRUE, 
            status = "primary"
          ),
          prettyCheckboxGroup(
            inputId = "checkgroup2",
            label = "Click me!", 
            thick = TRUE,
            choices = c("Click me !", "Me !", "Or me !"),
            animation = "pulse", 
            status = "info"
          )
        )
      ),
      dropdownMenu(
        type = "tasks", 
        badgeStatus = "danger",
        taskItem(value = 20, color = "aqua", "Refactor code"),
        taskItem(value = 40, color = "green", "Design new layout"),
        taskItem(value = 60, color = "yellow", "Another task"),
        taskItem(value = 80, color = "red", "Write documentation")
      )
    ),
    sidebar = dashboardSidebar(),
    body = dashboardBody(
      setShadow(class = "dropdown-menu")
    ),
    rightsidebar = rightSidebar(),
    title = "DashboardPage"
  ),
  server = function(input, output) { }
 )
}



