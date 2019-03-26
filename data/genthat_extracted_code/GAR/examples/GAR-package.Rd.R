library(GAR)


### Name: GAR-package
### Title: Authorize and Request Google Analytics data.
### Aliases: GAR-package GAR
### Keywords: package

### ** Examples



getCode(
        client_id="ABCDEFG"
        )

getRefresh(
            client_id="ABCDEFG",
            client_secret="HIJKLMNOP",
            code="QRSTUVWX"
            )

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
        token='abcdef',
        allResults=FALSE
        )

tokenRefresh(
            client_id="ABCDEFG",
            client_secret="HIJKLMNOP",
            token="QRSTUVWX"
            )




