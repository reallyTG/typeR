library(textreadr)


### Name: read_html
### Title: Read in .html Content
### Aliases: read_html
### Keywords: html

### ** Examples

html_dat <- read_html(
    system.file("docs/textreadr_creed.html", package = "textreadr")
)

## Not run: 
##D url <- "http://www.talkstats.com/index.php"
##D file <- download(url)
##D (txt <- read_html(url))
##D (txt <- read_html(file))
## End(Not run)



