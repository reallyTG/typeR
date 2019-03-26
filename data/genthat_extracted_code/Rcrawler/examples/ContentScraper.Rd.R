library(Rcrawler)


### Name: ContentScraper
### Title: ContentScraper
### Aliases: ContentScraper

### ** Examples

## Not run: 
##D 
##D #### Extract title, publishing date and article from the web page using css selectors
##D #
##D DATA<-ContentScraper(Url="http://glofile.com/index.php/2017/06/08/taux-nette-detente/",
##D CssPatterns = c(".entry-title",".published",".entry-content"), astext = TRUE)
##D 
##D #### The web page source can be provided also in HTML text (characters)
##D #
##D txthml<-"<html><title>blah</title><div><p>I m the content</p></div></html>"
##D DATA<-ContentScraper(HTmlText = txthml ,XpathPatterns = "//*/p")
##D 
##D #### Extract post title and bodt from the web page using Xpath patterns,
##D #  PatternsName can be provided as indication.
##D #
##D DATA<-ContentScraper(Url ="http://glofile.com/index.php/2017/06/08/athletisme-m-a-rome/",
##D XpathPatterns=c("//head/title","//*/article"),PatternsName=c("title", "article"))
##D 
##D #### Extract titles and contents of 3 Urls using CSS selectors, As result DATA variable
##D # will handle 6 elements.
##D #
##D urllist<-c("http://glofile.com/index.php/2017/06/08/sondage-quel-budget/",
##D "http://glofile.com/index.php/2017/06/08/cyril-hanouna-tire-a-boulets-rouges-sur-le-csa/",
##D "http://glofile.com/index.php/2017/06/08/placements-quelles-solutions-pour-doper/",
##D "http://glofile.com/index.php/2017/06/08/paris-un-concentre-de-suspens/")
##D DATA<-ContentScraper(Url =urllist, CssPatterns = c(".entry-title",".entry-content"),
##D PatternsName = c("title","content"))
##D 
##D #### Extract post title and list of comments from a set of blog pages,
##D # ManyPerPattern argument enables extracting many elements having same pattern from each
##D # page like comments, reviews, quotes and listing.
##D DATA<-ContentScraper(Url =urllist, CssPatterns = c(".entry-title",".comment-content p"),
##D PatternsName = c("title","comments"), astext = TRUE, ManyPerPattern = TRUE)
##D #### From this Forum page  e extract the post title and all replies using CSS selectors
##D # c("head > title",".post"), However, we know that each reply contain previous Replys
##D # as quote so we need to exclude To remove inner quotes in each reply we use
##D # ExcludeCSSPat c(".quote",".quoteheader a")
##D DATA<-ContentScraper(Url = "https://bitcointalk.org/index.php?topic=2334331.0",
##D CssPatterns = c("head > title",".post"), ExcludeCSSPat = c(".quote",".quoteheader"),
##D PatternsName = c("Title","Replys"), ManyPerPattern = TRUE)
##D 
##D #### Scrape data from web page requiring authentification
##D # replace \@ by @ before running follwing examples
##D # create a loggedin session
##D LS<-run_browser()
##D LS<-LoginSession(Browser = LS, LoginURL = 'https://manager.submittable.com/login',
##D    LoginCredentials = c('your email','your password'),
##D    cssLoginFields =c('#email', '#password'),
##D    XpathLoginButton ='//*[\@type=\"submit\"]' )
##D #Then scrape data with the session
##D DATA<-ContentScraper(Url='https://manager.submittable.com/beta/discover/119087',
##D      XpathPatterns = c('//*[\@id=\"submitter-app\"]/div/div[2]/div/div/div/div/div[3]',
##D       '//*[\@id=\"submitter-app\"]/div/div[2]/div/div/div/div/div[2]/div[1]/div[1]' ),
##D       PatternsName = c("Article","Title"), astext = TRUE, browser = LS )
##D #OR
##D page<-LinkExtractor(url='https://manager.submittable.com/beta/discover/119087',
##D                     browser = LS)
##D DATA<-ContentScraper(HTmlText = page$Info$Source_page,
##D      XpathPatterns = c("//*[\@id=\"submitter-app\"]/div/div[2]/div/div/div/div/div[3]",
##D      "//*[\@id=\"submitter-app\"]/div/div[2]/div/div/div/div/div[2]/div[1]/div[1]" ),
##D       PatternsName = c("Article","Title"),astext = TRUE )
##D 
##D To get all first elements of the lists in one vector (example all titles) :
##D VecTitle<-unlist(lapply(DATA, `[[`, 1))
##D To get all second elements of the lists in one vector (example all articles)
##D VecContent<-unlist(lapply(DATA, `[[`, 2))
##D 
## End(Not run)



