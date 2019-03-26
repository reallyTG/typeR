library(reutils)


### Name: ecitmatch
### Title: ecitmatch - searching PubMed with citation data
### Aliases: ecitmatch

### ** Examples

citstrings <- c("proc natl acad sci u s a|1991|88|3248|mann bj|Art1|",
                "science|1987|235|182|palmenber ac|Art2|")
x <- ecitmatch(citstrings)
x
if (x$no_errors()) {
  content(x, "parsed")
}




