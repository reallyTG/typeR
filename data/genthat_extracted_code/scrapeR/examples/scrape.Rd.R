library(scrapeR)


### Name: scrape
### Title: A Tool For Scraping and Parsing HTML and XML Documents From the
###   Web
### Aliases: scrape

### ** Examples

## Not run: 
##D ## Example 1.  Getting all of the package names available for download
##D ##             from CRAN (http://cran.r-project.org/web/packages/)
##D 
##D # First, pull in the page's source code, check for (and follow) a page redirection, 
##D # and retrieve the headers before deciding to parse the code.
##D pageSource<-scrape(url="http://cran.r-project.org/web/packages/",headers=TRUE,
##D 	parse=FALSE)
##D 
##D # Second, inspect the headers to ensure a status code of 200, which means the page
##D # was served properly.  If okay, then parse the object into an XML tree and retrieve
##D # all of the package names.
##D if(attributes(pageSource)$headers["statusCode"]==200) {
##D 	page<-scrape(object="pageSource")
##D 	xpathSApply(page,"//table//td/a",xmlValue)
##D } else {
##D 	cat("There was an error with the page. \n")
##D }
## End(Not run)

## Example 2. Parsing a local XML file, then pulling out information of interest

# First, locate and parse the demo recipe file supplied with this package
fileToLoad<-system.file("recipe.xml",package="scrapeR")
mmmCookies<-scrape(file=fileToLoad,isXML=TRUE)

# Next, retrieve the names of the dry ingredients that I'll need to buy
xpathSApply(mmmCookies[[1]],"//recipe/ingredient[@type='dry']/item",xmlValue)

# Next, remind myself how much flour is needed
paste(xpathSApply(mmmCookies[[1]],"//item[.='flour']/preceding-sibling::amount",
	xmlValue),xpathSApply(mmmCookies[[1]],"//item[.='flour']/
	preceding-sibling::unit",xmlValue))

# Finally, remind myself who the author of this recipe is
xpathSApply(mmmCookies[[1]],"//recipe",xmlGetAttr,"from")



