library(rtika)


### Name: tika_text
### Title: Get Plain Text
### Aliases: tika_text

### ** Examples

## No test: 
batch <- c(
 system.file("extdata", "jsonlite.pdf", package = "rtika"),
 system.file("extdata", "curl.pdf", package = "rtika"),
 system.file("extdata", "table.docx", package = "rtika"),
 system.file("extdata", "xml2.pdf", package = "rtika"),
 system.file("extdata", "R-FAQ.html", package = "rtika"),
 system.file("extdata", "calculator.jpg", package = "rtika"),
 system.file("extdata", "tika.apache.org.zip", package = "rtika")
)
text <- tika_text(batch)
## End(No test)



