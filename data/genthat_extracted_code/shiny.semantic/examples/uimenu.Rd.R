library(shiny.semantic)


### Name: uimenu
### Title: Create Semantic UI Menu
### Aliases: uimenu

### ** Examples


if (interactive()){
library(shiny)
library(shiny.semantic)

ui <- function() {
  shinyUI(
    semanticPage(
      title = "My page",
      suppressDependencies("bootstrap"),
      uimenu(menu_item("Menu"),
             uidropdown(
               "Action",
               uimenu(
                 menu_header(uiicon("file"), "File", is_item = FALSE),
                 menu_item(uiicon("wrench"), "Open"),
                 menu_item(uiicon("upload"), "Upload"),
                menu_item(uiicon("remove"), "Upload"),
                 menu_divider(),
                 menu_header(uiicon("user"), "User", is_item = FALSE),
                 menu_item(uiicon("add user"), "Add"),
                 menu_item(uiicon("remove user"), "Remove")),
               type = "",
               name = "unique_name",
               is_menu_item = TRUE),
             menu_item(uiicon("user"), "Profile", href = "#index", item_feature = "active"),
             menu_item("Projects", href = "#projects"),
             menu_item(uiicon("users"), "Team"),
             uimenu(menu_item(uiicon("add icon"), "New tab"), type = "right"))
    )
  )
}

server <- shinyServer(function(input, output) {
})

shinyApp(ui = ui(), server = server)
}



