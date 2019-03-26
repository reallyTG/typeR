library(shiny)


### Name: withMathJax
### Title: Load the MathJax library and typeset math expressions
### Aliases: withMathJax

### ** Examples

withMathJax(helpText("Some math here $$\\alpha+\\beta$$"))
# now we can just write "static" content without withMathJax()
div("more math here $$\\sqrt{2}$$")



