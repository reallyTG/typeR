library(shiny.semantic)


### Name: uilist
### Title: Create Semantic UI list with header, description and icons
### Aliases: uilist

### ** Examples


list_content <- data.frame(
  header = paste("Header", 1:5),
  description = paste("Description", 1:5),
  stringsAsFactors = FALSE
)

# Create a 5 element divided list with alert icons and description
uilist(list_content, "alert", is_divided = TRUE, is_description = TRUE)



