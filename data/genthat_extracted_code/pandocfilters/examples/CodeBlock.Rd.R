library(pandocfilters)


### Name: CodeBlock
### Title: Code Block
### Aliases: CodeBlock

### ** Examples

attr <- Attr("id", "Programming Language", list(c("key", "value")))
code <- "x <- 3\nprint('Hello R!')"
CodeBlock(attr, code)



