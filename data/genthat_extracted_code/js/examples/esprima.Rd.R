library(js)


### Name: esprima
### Title: JavaScrip Syntax Tree
### Aliases: esprima esprima_tokenize esprima_parse

### ** Examples

code <- "function test(x, y){ x = x || 1; y = y || 1; return x*y;}"
esprima_tokenize(code)
esprima_parse(code)



