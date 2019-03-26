library(geneplotter)


### Name: openHtmlPage
### Title: Open and close an HTML file for writing.
### Aliases: openHtmlPage closeHtmlPage
### Keywords: IO

### ** Examples

  fn <- tempfile()
  con <- openHtmlPage(fn, "My page")
  writeLines("Hello world", con)
  closeHtmlPage(con)
  readLines(paste(fn, ".html", sep=""))



