library(rvest)


### Name: encoding
### Title: Guess and repair faulty character encoding.
### Aliases: encoding guess_encoding repair_encoding

### ** Examples

# A file with bad encoding included in the package
path <- system.file("html-ex", "bad-encoding.html", package = "rvest")
x <- read_html(path)
x %>% html_nodes("p") %>% html_text()

guess_encoding(x)
# Two valid encodings, only one of which is correct
read_html(path, encoding = "ISO-8859-1") %>% html_nodes("p") %>% html_text()
read_html(path, encoding = "ISO-8859-2") %>% html_nodes("p") %>% html_text()



