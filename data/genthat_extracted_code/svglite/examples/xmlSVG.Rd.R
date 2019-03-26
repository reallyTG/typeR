library(svglite)


### Name: xmlSVG
### Title: Run plotting code and return svg
### Aliases: xmlSVG

### ** Examples

if (require("xml2")) {
  x <- xmlSVG(plot(1, axes = FALSE))
  x
  xml_find_all(x, ".//text")
}



