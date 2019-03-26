library(styler)


### Name: styler-package
### Title: Non-invasive pretty printing of R code
### Aliases: styler styler-package

### ** Examples

style_text("call( 1)")
style_text("1    + 1", strict = FALSE)
style_text("a%>%b", scope = "spaces")
style_text("a%>%b; a", scope = "line_breaks")
style_text("a%>%b; a", scope = "tokens")



