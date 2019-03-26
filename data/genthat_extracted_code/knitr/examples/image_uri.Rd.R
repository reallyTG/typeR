library(knitr)


### Name: image_uri
### Title: Encode an image file to a data URI
### Aliases: image_uri

### ** Examples

uri = image_uri(file.path(R.home("doc"), "html", "logo.jpg"))
cat(sprintf("<img src=\"%s\" />", uri), file = "logo.html")
if (interactive()) browseURL("logo.html")  # you can check its HTML source



