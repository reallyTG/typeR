library(styler)


### Name: style_text
### Title: Style a string
### Aliases: style_text

### ** Examples

style_text("call( 1)")
style_text("1    + 1", strict = FALSE)
style_text("a%>%b", scope = "spaces")
style_text("a%>%b; a", scope = "line_breaks")
style_text("a%>%b; a", scope = "tokens")
# the following is identical but the former is more convenient:
style_text("a<-3++1", style = tidyverse_style, strict = TRUE)
style_text("a<-3++1", transformers = tidyverse_style(strict = TRUE))



