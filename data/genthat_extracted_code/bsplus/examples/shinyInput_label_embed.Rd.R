library(bsplus)


### Name: shinyInput_label_embed
### Title: Embed an element into the label of a Shiny-input tag
### Aliases: shinyInput_label_embed

### ** Examples

library("shiny")

numericInput(inputId = "foo", label = "Enter a number", value = 0) %>%
  shinyInput_label_embed(
    shiny_iconlink() %>%
    bs_embed_popover(title = "Number", content = "Not a complex number")
  )




