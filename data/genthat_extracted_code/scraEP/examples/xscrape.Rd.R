library(scraEP)


### Name: xscrape
### Title: Extract information from webpages to a data.frame, using XPath
###   queries.
### Aliases: xscrape

### ** Examples

## Extract all external links and their titles from a wikipedia page
data(wiki)
wiki.parse <- XML::htmlParse(wiki)
links <- xscrape(wiki.parse, 
                 row.xpath= "//a[starts-with(./@href, 'http')]", 
                 col.xpath= c(title= ".", link= "./@href"))

## Not run: 
##D ## Convert results from a search for 'R' on duckduckgo.com
##D ## First download the search page
##D duck <- XML::htmlParse("http://duckduckgo.com/html/?q=R")
##D ## Then run xscrape on the dowloaded and parsed page
##D results <- xscrape(duck, 
##D                    row.xpath= "//div[contains(@class, 'result__body')]",
##D                    col.xpath= c(title= "./h2", 
##D                                 snippet= ".//*[@class='result__snippet']", 
##D                                 url= ".//a[@class='result__url']/@href"))
## End(Not run)

## Not run: 
##D ## Convert results from a search for 'R' and 'Julia' on duckduckgo.com
##D ## Directly provide the URLs to xscrape
##D results <- xscrape(c("http://duckduckgo.com/html/?q=R", 
##D                      "http://duckduckgo.com/html/?q=julia"), 
##D                    row.xpath= "//div[contains(@class, 'result__body')]",
##D                    col.xpath= c(title= "./h2", 
##D                                 snippet= ".//*[@class='result__snippet']", 
##D                                 url= ".//a[@class='result__url']/@href"))
## End(Not run)




