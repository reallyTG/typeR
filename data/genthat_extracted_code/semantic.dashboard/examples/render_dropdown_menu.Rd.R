library(semantic.dashboard)


### Name: render_dropdown_menu
### Title: Create a dropdown menu output.
### Aliases: render_dropdown_menu renderDropdownMenu

### ** Examples

## No test: 
dropdownMenuOutput("dropdown")

output$dropdown <- renderDropdownMenu({
  dropdownMenu(messageItem("Michał", "Test message", color = "teal"),
              messageItem("Marek", "Another test!", icon = "warning", color = "red"))
})
## End(No test)



