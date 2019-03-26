library(semantic.dashboard)


### Name: dropdown_menu_output
### Title: Create a dropdown menu output.
### Aliases: dropdown_menu_output dropdownMenuOutput

### ** Examples

## No test: 
dropdownMenuOutput("dropdown")

output$dropdown <- renderDropdownMenu({
  dropdownMenu(messageItem("Michał", "Test message", color = "teal"),
              messageItem("Marek", "Another test!", icon = "warning", color = "red"))
})
## End(No test)



