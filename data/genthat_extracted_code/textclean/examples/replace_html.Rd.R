library(textclean)


### Name: replace_html
### Title: Replace HTML Markup
### Aliases: replace_html
### Keywords: html

### ** Examples

x <- c(
    "<bold>Random</bold> text with symbols: &nbsp; &lt; &gt; &amp; &quot; &apos;",
    "<p>More text</p> &cent; &pound; &yen; &euro; &copy; &reg;"
)

replace_html(x)
replace_html(x, FALSE)
replace_white(replace_html(x, FALSE))



