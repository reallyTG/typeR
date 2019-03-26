library(Rcrawler)


### Name: LoginSession
### Title: Open a logged in Session
### Aliases: LoginSession

### ** Examples


## Not run: 
##D 
##D 
##D  #This function is based on web browser automation, so, before start,
##D  make sure you have successfully installed web driver (phantomjs).
##D  install_browser()
##D  # Run browser process and get its reference object
##D  br<- run_browser()
##D 
##D   brs<-LoginSession(Browser = br, LoginURL = 'http://glofile.com/wp-login.php',
##D                 LoginCredentials = c('demo','rc@pass@r'),
##D                 cssLoginFields =c('#user_login', '#user_pass'),
##D                 cssLoginButton='#wp-submit' )
##D 
##D  # To make sure that you have been successfully authenticated
##D  # Check URL of the current page after login redirection
##D  brs$getUrl()
##D  # Or Take screenshot of the website dashborad
##D  brs$takeScreenshot(file = "sc.png")
##D 
##D 
##D  brs$delete()
##D  brs$status()
##D  brs$go(url)
##D  brs$getUrl()
##D  brs$goBack()
##D  brs$goForward()
##D  brs$refresh()
##D  brs$getTitle()
##D  brs$getSource()
##D  brs$takeScreenshot(file = NULL)
##D  brs$findElement(css = NULL, linkText = NULL,
##D               partialLinkText = NULL, xpath = NULL)
##D  brs$findElements(css = NULL, linkText = NULL,
##D                partialLinkText = NULL, xpath = NULL)
##D  brs$executeScript(script, ...)
##D  brs$executeScriptAsync(script, ...)
##D  brs$setTimeout(script = NULL, pageLoad = NULL, implicit = NULL)
##D  brs$moveMouseTo(xoffset = 0, yoffset = 0)
##D  brs$click(button = c("left", "middle", "right"))
##D  brs$doubleClick(button = c("left", "middle", "right"))
##D  brs$mouseButtonDown(button = c("left", "middle", "right"))
##D  brs$mouseButtonUp(button = c("left", "middle", "right"))
##D  brs$readLog(type = c("browser", "har"))
##D  brs$getLogTypes()
##D 
## End(Not run)



