library(rtika)


### Name: tika
### Title: Main R Interface to 'Apache Tika'
### Aliases: tika

### ** Examples

## No test: 
#extract text
batch <- c(
  system.file("extdata", "jsonlite.pdf", package = "rtika"),
  system.file("extdata", "curl.pdf", package = "rtika"),
  system.file("extdata", "table.docx", package = "rtika"),
  system.file("extdata", "xml2.pdf", package = "rtika"),
  system.file("extdata", "R-FAQ.html", package = "rtika"),
  system.file("extdata", "calculator.jpg", package = "rtika"),
  system.file("extdata", "tika.apache.org.zip", package = "rtika")
)
text = tika(batch)
cat(substr(text[1],45,450))

#more complex metadata
if(requireNamespace('jsonlite')){

  json = tika(batch,c('J','t'))
  # 'J' is shortcut for jsonRecursive
  # 't' for text
  metadata = lapply(json, jsonlite::fromJSON )

  #embedded resources
  lapply(metadata, function(x){ as.character(x$'Content-Type') })

  lapply(metadata, function(x){ as.character(x$'Creation-Date') })

  lapply(metadata, function(x){  as.character(x$'X-TIKA:embedded_resource_path') })
}
## End(No test)



