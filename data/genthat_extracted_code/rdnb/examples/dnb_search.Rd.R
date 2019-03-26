library(rdnb)


### Name: dnb_search
### Title: Search the DNB catalogue - simple search
### Aliases: dnb_search

### ** Examples

## Not run: 
##D # title search
##D single.title <- dnb_search(title="katze")
##D multi.title <- dnb_search(title=c("katze", "kater", "+maus", "-hund"))
##D 
##D # author search
##D single.author <- dnb_search(author="kern")
##D author.or.author <- dnb_search(author=c("kern", "locke"))
##D author.and.author <- dnb_search(author=c("kern", "+locke"))
##D author.not.author <- dnb_search(author=c("kern", "-locke"))
##D 
##D # publication year 
##D single.year <- dnb_search(title="katze", year=2015)
##D sequence.of.years <- dnb_search(title="katze", year=2010:2015)
##D set.of.years <- dnb_search(title="katze", year=c(2010:2013, 2015))
##D 
##D # publisher search
##D single.publisher <- dnb_search(title="katze", publisher="kiepenheuer")
##D set.of.publishers <- dnb_search(title="katze", publisher=c("kiepenheuer", "piper"))
##D 
##D # keyword search
##D single.keyword <- dnb_search(author="kern")
##D keyword.or.keyword <- dnb_search(keyword=c("katze", "hund"))
##D keyword.and.keyword <- dnb_search(keyword=c("katze", "+hund"))
##D keyword.not.keyword <- dnb_search(keyword=c("katze", "-hund"))
##D 
##D # type search
##D single.type <- dnb_search(title="katze", type="books")
##D set.of.types <- dnb_search(title="katze", type=c("books", "articles", "online"))
##D 
##D # language search
##D single.language <- dnb_search(title="cat", language="eng")
##D set.of.languages <- dnb_search(title=c("cat", "katze"), language=c("eng", "ger"))
##D 
##D # change limit of results
##D first.result <- dnb_search(title="katze", limit=1)
##D 5.results.starting.with.the.21st <- dnb_search(title="katze", limit=c(5, 21))
##D all.results <- dnb_search(title="katze", limit="all")
## End(Not run)



