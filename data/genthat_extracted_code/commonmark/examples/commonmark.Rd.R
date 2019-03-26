library(commonmark)


### Name: commonmark
### Title: Parse and render markdown text
### Aliases: commonmark markdown_html markdown markdown_xml markdown_man
###   markdown_commonmark markdown_text markdown_latex

### ** Examples

md <- readLines("https://raw.githubusercontent.com/yihui/knitr/master/NEWS.md")
html <- markdown_html(md)
xml <- markdown_xml(md)
man <- markdown_man(md)
tex <- markdown_latex(md)
cm <- markdown_commonmark(md)
text <- markdown_text(md)



