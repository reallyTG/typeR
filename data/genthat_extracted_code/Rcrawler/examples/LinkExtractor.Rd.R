library(Rcrawler)


### Name: LinkExtractor
### Title: LinkExtractor
### Aliases: LinkExtractor

### ** Examples


## Not run: 
##D 
##D ###### Fetch a URL using GET request :
##D ######################################################
##D ##
##D ## Very Fast, but can't fetch javascript rendred pages or sections
##D 
##D # fetch the page with default config, then returns page info and internal links
##D 
##D page<-LinkExtractor(url="http://www.glofile.com")
##D 
##D # this will return  alse external links
##D 
##D page<-LinkExtractor(url="http://www.glofile.com", ExternalLInks = TRUE)
##D 
##D # Specify Useragent to overcome bots blocking by some websites rules
##D 
##D page<-LinkExtractor(url="http://www.glofile.com", ExternalLInks = TRUE,
##D        Useragent = "Mozilla/5.0 (Windows NT 6.3; Win64; x64)",)
##D 
##D # By default, only HTTP succeeded page are parsed, therefore, to force
##D # parse error pages like 404 you need to specify IndexErrPages,
##D 
##D page<-LinkExtractor(url="http://www.glofile.com/404notfoundpage",
##D       ExternalLInks = TRUE, IndexErrPages = c(200,404))
##D 
##D 
##D #### Use GET request with a proxy
##D #
##D proxy<-httr::use_proxy("190.90.100.205",41000)
##D pageinfo<-LinkExtractor(url="http://glofile.com/index.php/2017/06/08/taux-nette-detente/",
##D use_proxy = proxy)
##D 
##D #' Note : use_proxy arguments can' not't be configured with webdriver
##D 
##D ###### Fetch a URL using a web driver (virtual browser)
##D ######################################################
##D ##
##D ## Slow, because a headless browser called phantomjs will simulate
##D ## a user session on a website. It's useful for web page having important
##D ## javascript rendred sections such as menus.
##D ## We recommend that you first try normal previous request, if the function
##D ## returns a forbidden 403 status code or an empty/incomplete source code body,
##D ## then try to set a normal useragent like
##D ## Useragent = "Mozilla/5.0 (Windows NT 6.3; Win64; x64)",
##D ## if you still have issue then you shoud try to set up a virtual browser.
##D 
##D #1 Download and install phantomjs headless browser
##D install_browser()
##D 
##D #2 start browser process (takes 30 seconds usualy)
##D br <-run_browser()
##D 
##D #3 call the function
##D page<-LinkExtractor(url="http://www.master-maroc.com", Browser = br,
##D       ExternalLInks = TRUE)
##D 
##D #4 dont forget to stop the browser at the end of all your work with it
##D stop_browser(br)
##D 
##D ###### Fetch a web page that requires authentication
##D #########################################################
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
##D                 cssLoginFields =c('#user_login', '#user_pass'),
##D                 cssLoginButton='#wp-submit' )
##D 
##D #check if login successful
##D LS$session$getTitle()
##D #Or
##D LS$session$getUrl()
##D #Or
##D LS$session$takeScreenshot(file = 'sc.png')
##D 
##D #3 Retreive the target private page using the logged-in session
##D page<-LinkExtractor(url='http://glofile.com/index.php/2017/06/08/jcdecaux/',Browser = LS)
##D 
##D #4 dont forget to stop the browser at the end of all your work with it
##D stop_browser(LS)
##D 
##D 
##D ################### Returned Values #####################
##D #########################################################
##D 
##D # Returned 'page' variable should include :
##D # 1- list of page details,
##D # 2- Internal links
##D # 3- external links.
##D 
##D #1 Vector of extracted internal links  (in-links)
##D page$InternalLinks
##D 
##D #2 Vector of extracted external links  (out-links)
##D page$ExternalLinks
##D 
##D page$Info
##D 
##D # Requested Url
##D page$Info$Url
##D 
##D # Sum of extracted links
##D page$Info$SumLinks
##D 
##D # The status code of the HTTP response 200, 401, 300...
##D page$Info$Status_code
##D 
##D # The MIME type of this content from HTTP response
##D page$Info$Content_type
##D 
##D # Page text encoding UTF8, ISO-8859-1 , ..
##D page$Info$Encoding
##D 
##D # Page source code
##D page$Info$Source_page
##D 
##D Page title
##D page$Info$Title
##D 
##D Other returned values page$Info$Id, page$Info$Crawl_level,
##D page$Info$Crawl_status are only used by Rcrawler funtion.
##D 
##D 
## End(Not run)




