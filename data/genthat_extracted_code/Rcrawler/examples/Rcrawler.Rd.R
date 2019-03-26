library(Rcrawler)


### Name: Rcrawler
### Title: Rcrawler
### Aliases: Rcrawler

### ** Examples


## Not run: 
##D 
##D  ######### Crawl, index, and store all pages of a websites using 4 cores and 4 parallel requests
##D  #
##D  Rcrawler(Website ="http://glofile.com/", no_cores = 4, no_conn = 4)
##D 
##D  ######### Crawl and index the website using 8 cores and 8 parallel requests with respect to
##D  # robot.txt rules using Mozilla string in user agent.
##D 
##D  Rcrawler(Website = "http://www.example.com/", no_cores=8, no_conn=8, Obeyrobots = TRUE,
##D  Useragent="Mozilla 3.11")
##D 
##D  ######### Crawl the website using the default configuration and scrape specific data from
##D  # the website, in this case we need all posts (articles and titles) matching two XPath patterns.
##D  # we know that all blog posts have datesin their URLs like 2017/09/08 so to avoid
##D  # collecting category or other pages we can tell the crawler that desired page's URLs
##D  # are like 4-digit/2-digit/2-digit/ using regular expression.
##D  # Note thatyou can use the excludepattern  parameter to exclude a node from being
##D  # extracted, e.g., in the case that a desired node includes (is a parent of) an
##D  # undesired "child" node. (article having inner ads or menu)
##D 
##D  Rcrawler(Website = "http://www.glofile.com/", dataUrlfilter =  "/[0-9]{4}/[0-9]{2}/",
##D  ExtractXpathPat = c("//*/article","//*/h1"), PatternsNames = c("content","title"))
##D 
##D  ######### Crawl the website. and collect pages having URLs matching this regular expression
##D  # pattern (/[0-9]{4}/[0-9]{2}/). Collected pages will be stored in a local repository
##D  # named "myrepo". And The crawler stops After reaching the third level of website depth.
##D 
##D   Rcrawler(Website = "http://www.example.com/", no_cores = 4, no_conn = 4,
##D   dataUrlfilter =  "/[0-9]{4}/[0-9]{2}/", DIR = "./myrepo", MaxDepth=3)
##D 
##D 
##D  ######### Crawl the website and collect/scrape only webpage related to a topic
##D  # Crawl the website and collect pages containing keyword1 or keyword2 or both.
##D  # To crawl a website and collect/scrape only some web pages related to a specific topic,
##D  # like gathering posts related to Donald trump from a news website. Rcrawler function
##D  # has two useful parameters KeywordsFilter and KeywordsAccuracy.
##D  #
##D  # KeywordsFilter : a character vector, here you should provide keywords/terms of the topic
##D  # you are looking for. Rcrawler will calculate an accuracy score based on matched keywords
##D  # and their occurrence on the page, then it collects or scrapes only web pages with at
##D  # least a score of 1% wich mean at least one keyword is founded one time on the page.
##D  # This parameter must be a vector with at least one keyword like c("mykeyword").
##D  #
##D  # KeywordsAccuracy: Integer value range between 0 and 100, used only in combination with
##D  # KeywordsFilter parameter to determine the minimum accuracy of web pages to be collected
##D  # /scraped. You can use one or more search terms; the accuracy will be calculated based on
##D  # how many provided keywords are found on on the page plus their occurrence rate.
##D  # For example, if only one keyword is provided c("keyword"), 50% means one occurrence of
##D  # "keyword" in the page 100% means five occurrences of "keyword" in the page
##D 
##D   Rcrawler(Website = "http://www.example.com/", KeywordsFilter = c("keyword1", "keyword2"))
##D 
##D  # Crawl the website and collect webpages that has an accuracy percentage higher than 50%
##D  # of matching keyword1 and keyword2.
##D 
##D   Rcrawler(Website = "http://www.example.com/", KeywordsFilter = c("keyword1", "keyword2"),
##D    KeywordsAccuracy = 50)
##D 
##D 
##D  ######### Crawl a website search results
##D  # In the case of scraping web pages specific to a topic of your interest; The methods
##D  # above has some disadvantages which are complexity and time consuming as the whole
##D  # website need to be crawled and each page is analyzed to findout desired pages.
##D  # As result you may want to make use of the search box of the website and then directly
##D  # crawl only search result pages. To do so, you may use \code{crawlUrlfilter} and
##D  # \code{dataUrlfilter} arguments or \code{crawlZoneCSSPat}/\code{CrawlZoneXPath} with
##D  \code{dataUrlfilter}.
##D  #- \code{crawlUrlfilter}:what urls shoud be crawled (followed).
##D  #- \code{dataUrlfilter}: what urls should be collected (download HTML or extract data ).
##D  #- \code{crawlZoneCSSPat} Or \code{CrawlZoneXPath}: the page section where links to be
##D      crawled are located.
##D 
##D  # Example1
##D  # the command below will crawl all result pages knowing that result pages are like :
##D     http://glofile.com/?s=sur
##D     http://glofile.com/page/2/?s=sur
##D     http://glofile.com/page/2/?s=sur
##D  # so they all have "s=sur" in common
##D  # Post pages should be crawled also, post urls are like
##D    http://glofile.com/2017/06/08/placements-quelles-solutions-pour-dper/
##D    http://glofile.com/2017/06/08/taux-nette-detente/
##D  # which contain a date format march regex "[0-9]{4}/[0-9]{2}/[0-9]{2}
##D 
##D  Rcrawler(Website = "http://glofile.com/?s=sur", no_cores = 4, no_conn = 4,
##D  crawlUrlfilter = c("[0-9]{4}/[0-9]{2}/[0-9]d{2}","s=sur"))
##D 
##D  # In addition by using dataUrlfilter we specify that :
##D  #  1- only post pages should be collected/scraped not all crawled result pages
##D  #  2- additional urls should not be retreived from post page
##D  #  (like post urls listed in 'related topic' or 'see more' sections)
##D 
##D  Rcrawler(Website = "http://glofile.com/?s=sur", no_cores = 4, no_conn = 4,
##D  crawlUrlfilter = c("[0-9]{4}/[0-9]{2}/[0-9]d{2}","s=sur"),
##D  dataUrlfilter = "[0-9]{4}/[0-9]{2}/[0-9]{2}")
##D 
##D  # Example 2
##D  # collect job pages from indeed search result of "data analyst"
##D 
##D  Rcrawler(Website = "https://www.indeed.com/jobs?q=data+analyst&l=Tampa,+FL",
##D   no_cores = 4 , no_conn = 4,
##D   crawlUrlfilter = c("/rc/","start="), dataUrlfilter = "/rc/")
##D  # To include related post jobs on each collected post remove dataUrlfilter
##D 
##D  # Example 3
##D  # One other way to control the crawler behaviour, and to avoid fetching
##D  # unnecessary links is to indicate to crawler the page zone of interest
##D  # (a page section from where links should be grabed and crawled).
##D  # The follwing example is similar to the last one,except this time we provide
##D  # the xpath pattern of results search section to be crawled with all links within.
##D 
##D  Rcrawler(Website = "https://www.indeed.com/jobs?q=data+analyst&l=Tampa,+FL",
##D   no_cores = 4 , no_conn = 4,MaxDepth = 3,
##D   crawlZoneXPath = c("//*[\@id='resultsCol']"), dataUrlfilter = "/rc/")
##D 
##D 
##D  ######### crawl and scrape a forum posts and replays, each page has a title and
##D  # a list of replays , ExtractCSSPat = c("head>title","div[class=\"post\"]") .
##D  # All replays have the same pattern, therfore we set TRUE ManyPerPattern
##D  # to extract all of them.
##D 
##D  Rcrawler(Website = "https://bitcointalk.org/", ManyPerPattern = TRUE,
##D  ExtractCSSPat = c("head>title","div[class=\"post\"]"),
##D  no_cores = 4, no_conn =4, PatternsName = c("Title","Replays"))
##D 
##D 
##D  ######### scrape data/collect pages meeting your custom criteria,
##D  # This is useful when filetring by keyword or urls does not fullfil your needs, for example
##D  # if you want to detect target pages  by classification/prediction model, or simply by checking
##D  # a sppecifi text value/field in the web page, you can create a custom filter function for
##D  # page selection as follow.
##D  # First will create and test our function and test it with un one page .
##D 
##D  pageinfo<-LinkExtractor(url="http://glofile.com/index.php/2017/06/08/sondage-quel-budget/",
##D  encod=encod, ExternalLInks = TRUE)
##D 
##D  Customfilterfunc<-function(pageinfo){
##D   decision<-FALSE
##D   # put your conditions here
##D     if(pageinfo$Info$Source_page ... ) ....
##D   # then return a boolean value TRUE : should be collected / FALSE should be escaped
##D 
##D   return TRUE or FALSE
##D  }
##D   # Finally, you just call it inside Rcrawler function, Then the crawler will evaluate each
##D    page using your set of rules.
##D 
##D  Rcrawler(Website = "http://glofile.com", no_cores=2, FUNPageFilter= Customfilterfunc )
##D 
##D  ######### Website Network
##D  # Crawl the entire website, and create network edges DATA of internal links.
##D  # Using Igraph for exmaple you can plot the network by the following commands
##D 
##D    Rcrawler(Website = "http://glofile.com/" , no_cores = 4, no_conn = 4, NetworkData = TRUE)
##D    library(igraph)
##D    network<-graph.data.frame(NetwEdges, directed=T)
##D    plot(network)
##D 
##D   # Crawl the entire website, and create network edges DATA of internal and external links .
##D   Rcrawler(Website = "http://glofile.com/" , no_cores = 4, no_conn = 4, NetworkData = TRUE,
##D   NetwExtLinks = TRUE)
##D 
##D ###### Crawl a website using a web driver (Vitural browser)
##D ###########################################################################
##D ## In some case you may need to retreive content from a web page which
##D ## requires authentication via a login page like private forums, platforms..
##D ## In this case you need to run LoginSession function to establish a
##D ## authenticated browser session; then use LinkExtractor to fetch
##D ## the URL using the auhenticated session.
##D ## In the example below we will try to fech a private blog post which
##D ## require authentification .
##D 
##D If you retreive the page using regular function LinkExtractor or your browser
##D page<-LinkExtractor("http://glofile.com/index.php/2017/06/08/jcdecaux/")
##D The post is not visible because it's private.
##D Now we will try to login to access this post using folowing creditentials
##D username : demo and password : rc@pass@r
##D 
##D #1 Download and install phantomjs headless browser (skip if installed)
##D install_browser()
##D 
##D #2 start browser process
##D br <-run_browser()
##D 
##D #3 create auhenticated session
##D #  see LoginSession for more details
##D 
##D  LS<-LoginSession(Browser = br, LoginURL = 'http://glofile.com/wp-login.php',
##D                 LoginCredentials = c('demo','rc@pass@r'),
##D                 cssLoginCredentials =c('#user_login', '#user_pass'),
##D                 cssLoginButton='#wp-submit' )
##D 
##D #check if login successful
##D LS$session$getTitle()
##D #Or
##D LS$session$getUrl()
##D #Or
##D LS$session$takeScreenshot(file = 'sc.png')
##D LS$session$getUrl()
##D LS<-run_browser()
##D LS<-LoginSession(Browser = LS, LoginURL = 'https://manager.submittable.com/login',
##D    LoginCredentials = c('your email','your password'),
##D    cssLoginFields =c('#email', '#password'),
##D    XpathLoginButton ='//*[\@type=\"submit\"]' )
##D 
##D 
##D # page<-LinkExtractor(url='https://manager.submittable.com/beta/discover/119087',
##D LoggedSession = LS)
##D # cont<-ContentScraper(HTmlText = page$Info$Source_page,
##D XpathPatterns = c("//*[\@id=\"submitter-app\"]/div/div[2]/div/div/div/div/div[3]",
##D "//*[\@id=\"submitter-app\"]/div/div[2]/div/div/div/div/div[2]/div[1]/div[1]" ),
##D PatternsName = c("Article","Title"),astext = TRUE )
##D 
## End(Not run)





