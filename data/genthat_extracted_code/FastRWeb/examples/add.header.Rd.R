library(FastRWeb)


### Name: add.header
### Title: Add HTML headers to FastRWeb response.
### Aliases: add.header
### Keywords: interface

### ** Examples

## main.css.R: serve a static file (main.css) with cache control
run <- function(...) {
  # last for at most an hour
  add.header("Cache-Control: max-age=3600")
  WebResult("file", "main.css", "text/css")
}



