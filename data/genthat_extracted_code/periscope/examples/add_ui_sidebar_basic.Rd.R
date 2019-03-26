library(periscope)


### Name: add_ui_sidebar_basic
### Title: Add UI Elements to the Sidebar (Basic Tab)
### Aliases: add_ui_sidebar_basic

### ** Examples

require(shiny)

s1 <- selectInput("sample1", "A Select", c("A", "B", "C"))
s2 <- radioButtons("sample2", NULL, c("A", "B", "C"))

add_ui_sidebar_basic(list(s1, s2), append = FALSE)




