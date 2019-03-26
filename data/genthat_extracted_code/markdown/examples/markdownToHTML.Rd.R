library(markdown)


### Name: markdownToHTML
### Title: Render markdown to HTML
### Aliases: markdownToHTML

### ** Examples

(markdownToHTML(text = "Hello World!", fragment.only = TRUE))
(markdownToHTML(file = NULL, text = "_text_ will override _file_", fragment.only = TRUE))
# write HTML to an output file
markdownToHTML(text = "_Hello_, **World**!", output = "test.html")



