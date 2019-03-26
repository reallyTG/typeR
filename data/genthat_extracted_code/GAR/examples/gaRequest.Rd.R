library(GAR)


### Name: gaRequest
### Title: Request data from Google Analytics API
### Aliases: gaRequest

### ** Examples


gaRequest(
        id=c('ga:123456789','ga:987654321'), 
        dimensions='ga:date,ga:month', 
        metrics='ga:sessions,ga:users,ga:pageviews', 
        start='YYYY-MM-DD',
        end='YYYY-MM-DDD',
        sort='-ga:sessions,ga:users',
        max='1000',
        filters='ga:browser==VALUE,ga:city==VALUE',
        segment='abcdef',
        allResults=FALSE,
        token='abcdef'
        )



