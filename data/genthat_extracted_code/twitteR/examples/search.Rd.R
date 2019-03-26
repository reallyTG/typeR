library(twitteR)


### Name: searchTwitter
### Title: Search twitter
### Aliases: searchTwitter Rtweets searchTwitteR
### Keywords: interface

### ** Examples

  ## Not run: 
##D   	searchTwitter("#beer", n=100)
##D           Rtweets(n=37)
##D 
##D   	## Search between two dates
##D           searchTwitter('charlie sheen', since='2011-03-01', until='2011-03-02')
##D 
##D   	## geocoded results
##D   	searchTwitter('patriots', geocode='42.375,-71.1061111,10mi')
##D 
##D     ## using resultType
##D     searchTwitter('world cup+brazil', resultType="popular", n=15)
##D     searchTwitter('from:hadleywickham', resultType="recent", n=10)
##D 
##D   
## End(Not run)



