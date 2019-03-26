library(shiny.semantic)


### Name: uidropdown
### Title: Create Semantic UI Dropdown
### Aliases: uidropdown

### ** Examples


uidropdown(
  "Dropdown menu",
  uiicon(type = "dropdown"),
  uimenu(
    menu_header("Header"),
    menu_divider(),
    menu_item("Option 1"),
    menu_item("Option 2")
  ),
  name = "dropdown_menu",
  dropdown_specs = list("duration: 500")
)



