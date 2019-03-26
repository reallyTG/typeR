library(RSelenium)


### Name: remoteDriver-class
### Title: CLASS remoteDriver
### Aliases: remoteDriver-class remoteDriver

### ** Examples

## Not run: 
##D # start the server if one isnt running
##D startServer()
##D 
##D # use default server initialisation values
##D remDr <- remoteDriver$new()
##D 
##D # send request to server to initialise session
##D remDr$open()
##D 
##D # navigate to R home page
##D remDr$navigate("http://www.r-project.org")
##D 
##D # navigate to www.bbc.co.uk notice the need for http://
##D remDr$navigate("http://www.bbc.co.uk")
##D 
##D # go backwards and forwards
##D remDr$goBack()
##D 
##D remDr$goForward()
##D 
##D remDr$goBack()
##D 
##D # Examine the page source
##D frontPage <- remDr$getPageSource()
##D 
##D # The R homepage contains frames
##D webElem <- remDr$findElements(value = "//frame")
##D sapply(webElem, function(x) {x$getElementAttribute('name')})
##D 
##D # The homepage contains 3 frames: logo, contents and banner
##D # switch to the `contents` frame
##D webElem <- remDr$findElement(using = 'name', value = 'contents')
##D remDr$switchToFrame(webElem$elementId)
##D 
##D # re-examine the page source
##D 
##D contentPage <- remDr$getPageSource()
##D identical(contentPage, frontPage) # false we hope!!
##D 
##D # Find the link for the search page on R homepage. Use xpath as default.
##D webElem <- remDr$findElement(value = '//a[@href = "search.html"]')
##D webElem$getElementAttribute('href')
##D # http://www.r-project.org/search.html
##D 
##D # click the search link
##D webElem$clickElement()
##D 
##D # FILL OUT A GOOGLE SEARCH FORM
##D remDr$navigate("http://www.google.com")
##D 
##D # show different methods of accessing DOM components
##D 
##D webElem1 <- remDr$findElement(using = 'name', value = 'q')
##D webElem2 <- remDr$findElement(
##D   using = 'id',
##D   value = webElem1$getElementAttribute('id')[[1]])
##D webElem3 <- remDr$findElement(using = 'xpath',
##D                               value = '//input[@name = "q"]')
##D 
##D # Enter some text in the search box
##D 
##D webElem1$sendKeysToElement(list('RSelenium was here'))
##D 
##D # clear the text previously entered
##D 
##D webElem1$clearElement()
##D 
##D # show an example of sending a key press
##D webElem1$sendKeysToElement(list('R', key = 'enter'))
##D 
##D # Collate the results for the `R` search
##D googLinkText <- remDr$findElements(value = "//h3[@class = 'r']")
##D linkHeading <- sapply(googLinkText, function(x) x$getElementText())
##D googLinkDesc <- remDr$findElements(value = "//div[@class = 's']")
##D linkDescription <- sapply(googLinkDesc, function(x) x$getElementText())
##D googLinkHref <- remDr$findElements(value = "//h3[@class = 'r']/a")
##D linkHref <- sapply(googLinkHref,
##D                    function(x) x$getElementAttribute('href'))
##D 
##D data.frame(heading = linkHeading,
##D            description = linkDescription, href = linkHref)
##D 
##D # Example of javascript call
##D remDr$executeScript("return arguments[0] + arguments[1];", args = 1:2)
##D # Example of javascript async call
##D jsscript <-
##D   "arguments[arguments.length - 1](arguments[0] + arguments[1]);"
##D remDr$executeAsyncScript(jsscript, args = 1:2)
##D 
##D # EXAMPLE INJECTING INTO PHANTOMJS using phantomExecute
##D require(RSelenium)
##D pJS <- wdman::phantomjs(port = 4932L)
##D remDr <- remoteDriver(browserName = "phantomjs", port = 4932L)
##D remDr$open(silent = TRUE)
##D remDr$navigate("http://ariya.github.com/js/random/")
##D # returns a set of random numbers
##D remDr$findElement("id", "numbers")$getElementText()[[1]]
##D result = remDr$phantomExecute("var page = this;
##D                                page.onInitialized = function () {
##D                                page.evaluate(function () {
##D                                Math.random = function() {return 42/100}
##D                                })
##D                                }", list());
##D remDr$navigate("http://ariya.github.com/js/random/")
##D # Math.random returns our custom function
##D remDr$findElement("id", "numbers")$getElementText()[[1]]
##D remDr$close()
##D pJS$stop()
## End(Not run)




