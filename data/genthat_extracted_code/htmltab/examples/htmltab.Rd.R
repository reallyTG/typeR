library(htmltab)


### Name: htmltab
### Title: Assemble a data frame from HTML table data
### Aliases: htmltab

### ** Examples

## Not run: 
##D # When no spans are present, htmltab produces output close to XML's readHTMLTable(),
##D but it removes many types of non-data elements (footnotes, non-visible HTML elements, etc)
##D 
##D  url <- "http://en.wikipedia.org/wiki/World_population"
##D  xp <- "//caption[starts-with(text(),'World historical')]/ancestor::table"
##D  htmltab(doc = url, which = xp)
##D 
##D  popFun <- function(node) {
##D    x <- XML::xmlValue(node)
##D    gsub(',', '', x)
##D  }
##D 
##D  htmltab(doc = url, which = xp, bodyFun = popFun)
##D 
##D #This table lacks header information. We provide them through colNames.
##D #We also need to set header = 0 to indicate that no header is present.
##D doc <- "http://en.wikipedia.org/wiki/FC_Bayern_Munich"
##D xp2 <- "//td[text() = 'Head coach']/ancestor::table"
##D htmltab(doc = doc, which = xp2, header = 0, encoding = "UTF-8", colNames = c("name", "role"))
##D 
##D #htmltab recognizes column spans and produces a one-dimension vector of variable information,
##D #also removes automatically superscript information since these are usually not of use.
##D 
##D  doc <- "http://en.wikipedia.org/wiki/Usage_share_of_web_browsers"
##D  xp3 <-  "//table[7]"
##D  bFun <- function(node) {
##D    x <- XML::xmlValue(node)
##D    gsub('%$', '', x)
##D  }
##D 
##D  htmltab(doc = doc, which = xp3, bodyFun = bFun)
##D 
##D 
##D htmltab("https://en.wikipedia.org/wiki/Arjen_Robben", which = 3,
##D header = 1:2)
##D 
##D 
##D #When header information appear throughout the body, you can specify their
##D #position in the header formula
##D 
##D htmltab(url, which = "//table[@id='team_gamelogs']", header = . + "//td[./strong]")
## End(Not run)



