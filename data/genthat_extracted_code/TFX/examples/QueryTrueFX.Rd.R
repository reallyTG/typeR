library(TFX)


### Name: ConnectTrueFX
### Title: Query TrueFX(tm)
### Aliases: ConnectTrueFX QueryTrueFX

### ** Examples

## Cannot run these because there may not be an internet connection
## Not run: 
##D QueryTrueFX()  #unauthenticated
##D QueryTrueFX(pretty=FALSE)
##D QueryTrueFX(parse=FALSE)
##D 
##D ## For authenticated session, you must have a username and password (it's free).
##D ## Use your username and passward instead of JSTrader and Ou812
##D id <- ConnectTrueFX('EUR/USD,GBP/USD', username='JSTrader', password='Ou812')
##D QueryTrueFX(id)
##D QueryTrueFX(ConnectTrueFX(username='JSTrader', password='Ou812',
##D                           format='csv'), parse=FALSE)
##D 
##D QueryTrueFX(ConnectTrueFX(username='JSTrader', password='Ou812',
##D                           format='html'), parse=FALSE)
##D 
##D ## If you have shiny installed
##D ## install.packages("shiny", repos="http://rstudio.org/_packages")
##D library(shiny)
##D runGist("4122626")
##D ## view the code for this shiny app at
##D #browseURL("https://gist.github.com/4122626")
## End(Not run)



