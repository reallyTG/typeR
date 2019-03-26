library(xfun)


### Name: file_ext
### Title: Manipulate filename extensions
### Aliases: file_ext sans_ext with_ext

### ** Examples

library(xfun)
p = c("abc.doc", "def123.tex", "path/to/foo.Rmd")
file_ext(p)
sans_ext(p)
with_ext(p, ".txt")
with_ext(p, c(".ppt", ".sty", ".Rnw"))
with_ext(p, "html")



