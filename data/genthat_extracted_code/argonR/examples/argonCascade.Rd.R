library(argonR)


### Name: argonCascade
### Title: Create a Boostrap 4 cascade effect
### Aliases: argonCascade

### ** Examples

if (interactive()) {
 library(argonR)
 argonSection(
  size = "lg",
  status = "default",
  cascade = TRUE,
  
  argonH1(display = 3, "ArgonR Cascade Effect") %>% 
    argonPadding(orientation = "l", value = 5) %>%
    argonPadding(orientation = "b", value = 5) %>%
    argonTextColor(color = "white"),
  
  argonCascade(
    argonCascadeItem(name = "diamond", src = "https://www.google.com"),
    argonCascadeItem(name = "album-2", size = "sm"),
    argonCascadeItem(name = "app", size = "sm"),
    argonCascadeItem(name = "atom", size = "sm"),
    argonCascadeItem(name = "bag-17", src = "https://www.google.com"),
    argonCascadeItem(name = "bell-55"),
    argonCascadeItem(name = "credit-card"),
    argonCascadeItem(name = "briefcase-24", size = "sm", "https://www.google.com"),
    argonCascadeItem(name = "building", size = "sm"),
    argonCascadeItem(name = "button-play", size = "sm"),
    argonCascadeItem(name = "calendar-grid-58"),
    argonCascadeItem(name = "camera-compact"),
    argonCascadeItem(name = "chart-bar-32")
  )
 )
}




