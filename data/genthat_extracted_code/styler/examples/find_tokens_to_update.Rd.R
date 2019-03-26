library(styler)


### Name: find_tokens_to_update
### Title: Find the tokens to update when applying a reference indention
### Aliases: find_tokens_to_update
### Keywords: internal

### ** Examples

style_text("function(a =
b,
dd
) {}", scope = "indention")
style_text("function(a,
b,
dd
) {}", scope = "indention")



