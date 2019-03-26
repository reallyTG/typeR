library(styler)


### Name: tidyverse_style
### Title: The tidyverse style
### Aliases: tidyverse_style

### ** Examples

style_text("call( 1)", style = tidyverse_style, scope = "spaces")
style_text("call( 1)", transformers = tidyverse_style(strict = TRUE))
style_text(c("ab <- 3", "a  <-3"), strict = FALSE) # keeps alignment of "<-"
style_text(c("ab <- 3", "a  <-3"), strict = TRUE) # drops alignment of "<-"



