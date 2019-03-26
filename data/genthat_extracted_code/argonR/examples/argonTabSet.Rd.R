library(argonR)


### Name: argonTabSet
### Title: Create a Boostrap 4 tabs
### Aliases: argonTabSet

### ** Examples

if (interactive()) {
 library(argonR)
 argonTabSet(
  id = "tab-1",
  card_wrapper = TRUE,
  horizontal = TRUE,
  circle = FALSE,
  size = "sm",
  width = 6,
  iconList = list("cloud-upload-96", "bell-55", "calendar-grid-58"),
  argonTab(
    tabName = "Tab 1",
    active = FALSE,
    tabText1
  ),
  argonTab(
    tabName = "Tab 2",
    active = TRUE,
    tabText2
  ),
  argonTab(
    tabName = "Tab 3",
    active = FALSE,
    tabText3
  )
 )
}





