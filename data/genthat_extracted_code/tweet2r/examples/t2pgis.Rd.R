library(tweet2r)


### Name: t2pgis
### Title: Set up parameters to JSON parsing and export it to a postGIS
###   database.
### Aliases: t2pgis

### ** Examples


## Not run: 
##D 
##D #create a postgres connection
##D connection <- con <- dbConnect(PostgreSQL(), host="urls host",port=5432, 
##D                     user="user", password="assword", dbname="pgistweets")
##D fileprefix="tweets"
##D 
##D t2pgis(fileprefix, connection)
##D 
##D 	
## End(Not run)



