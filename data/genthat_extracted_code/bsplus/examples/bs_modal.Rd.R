library(bsplus)


### Name: bs_modal
### Title: Modal window
### Aliases: bs_modal bs_modal_closebutton bs_attach_modal

### ** Examples

library("htmltools")
library("shiny")

bs_modal(id = "modal", title = "I'm a modal", body = "Yes, I am.")
bs_button("Click for modal") %>%
  bs_attach_modal(id_modal = "modal")

bs_modal(
  id = "modal_large",
  title = "I'm a modal",
  size = "large",
  body = includeMarkdown(system.file("markdown", "modal.md", package = "bsplus"))
)
bs_button("Click for modal") %>%
  bs_attach_modal(id_modal = "modal_large")




