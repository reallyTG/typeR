library(FastRWeb)


### Name: out
### Title: FastRWeb HTML output functions
### Aliases: out oprint otable ohead oclear
### Keywords: interface

### ** Examples

  run <- function(...) {
    ohead("My Table", level=2)
    d <- data.frame(a = 1:3, b = c("foo", "bar", "foobar"))
    otable(d)
    out("<p><b>Verbatim R output:</b><br>")
    oprint(str(d))
    done()
  }    



