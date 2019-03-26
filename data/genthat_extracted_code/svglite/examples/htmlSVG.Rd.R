library(svglite)


### Name: htmlSVG
### Title: Run plotting code and view svg in RStudio Viewer or web broswer.
### Aliases: htmlSVG

### ** Examples

if (require("htmltools")) {
  htmlSVG(plot(1:10))
  htmlSVG(hist(rnorm(100)))
}



