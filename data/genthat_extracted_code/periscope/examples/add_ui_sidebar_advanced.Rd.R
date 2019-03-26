library(periscope)


### Name: add_ui_sidebar_advanced
### Title: Add UI Elements to the Sidebar (Advanced Tab)
### Aliases: add_ui_sidebar_advanced

### ** Examples

require(shiny)

s1 <- selectInput("sample1", "A Select", c("A", "B", "C"))
s2 <- radioButtons("sample2", NULL, c("A", "B", "C"))

add_ui_sidebar_advanced(list(s1, s2), append = FALSE)




