library(blogdown)


### Name: shortcode
### Title: Helper functions to write Hugo shortcodes using the R syntax
### Aliases: shortcode shortcode_html shortcodes

### ** Examples

library(blogdown)

shortcode("tweet", "1234567")
shortcodes("tweet", as.character(1:5))  # multiple tweets
shortcode("figure", src = "/images/foo.png", alt = "A nice figure")
shortcode("highlight", "bash", .content = "echo hello world;")

shortcode_html("myshortcode", .content = "My <strong>shortcode</strong>.")



