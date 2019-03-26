library(gtrendsR)


### Name: gtrends
### Title: Google Trends Query
### Aliases: gtrends

### ** Examples


## Not run: 
##D 
##D head(gtrends("NHL")$interest_over_time)
##D head(gtrends("NHL")$related_topics)
##D head(gtrends("NHL")$related_queries)
##D 
##D head(gtrends(c("NHL", "NFL"))$interest_over_time)
##D 
##D head(gtrends(c("NHL", "NFL"), geo = c("CA", "US"))$interest_over_time)
##D 
##D ## Interest by city
##D 
##D gtrends(keyword="obama",geo="US-AL-630")
##D 
##D ## Sport category (20)
##D data(categories)
##D categories[grepl("^Sport", categories$name), ]
##D gtrends(c("NHL", "NFL"), geo = c("CA", "US"), category = 20)
##D gtrends(geo = c("CA"), category = 20)
##D 
##D ## Playing with time format
##D 
##D gtrends(c("NHL", "NFL"), time = "now 1-H") # last hour
##D gtrends(c("NHL", "NFL"), time = "now 4-H") # last four hours
##D gtrends(c("NHL", "NFL"), time = "now 1-d") # last day
##D gtrends(c("NHL", "NFL"), time = "today 1-m") # last 30 days
##D gtrends(c("NHL", "NFL"), time = "today 3-m") # last 90 days
##D gtrends(c("NHL", "NFL"), time = "today 12-m") # last 12 months
##D gtrends(c("NHL", "NFL"), time = "today+5-y") # last five years (default)
##D gtrends(c("NHL", "NFL"), time = "all") # since 2004
##D 
##D 
##D ## Custom date format
##D 
##D gtrends(c("NHL", "NFL"), time = "2010-01-01 2010-04-03")
##D 
##D ## Search from various Google's services
##D 
##D head(gtrends(c("NHL", "NFL"), gprop = "news")$interest_over_time)
##D head(gtrends(c("NHL", "NFL"), gprop = "youtube")$interest_over_time)
##D 
##D ## Language settings
##D 
##D head(gtrends("NHL", hl = "en")$related_topics)
##D head(gtrends("NHL", hl = "fr")$related_topics)
## End(Not run)



