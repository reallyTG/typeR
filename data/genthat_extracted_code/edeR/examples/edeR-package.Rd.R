library(edeR)


### Name: edeR
### Title: Email data extraction using R
### Aliases: edeR
### Keywords: package

### ** Examples

## Not run: 
##D # Extract maximum 5 emails from the specified folder. 
##D # User needs to provide his/her valid Gmail address and password.
##D dat1 <- extractMbox(username="username@gmail.com",
##D                     password="password",
##D                     folder="foldar",
##D                     nmail=5)
##D 
##D # To extract maximum of 5 emails from inbox between June 6, 2013 to June 6, 2013
##D dat2 <- extractBetween(username="username@gmail.com",
##D                        password="password",
##D                        folder="inbox",
##D                        startDate="06-Jun-2013",
##D                        endDate="06-Jun-2013",
##D                        nmail=5)
##D 
##D # To extract maximum 5 emails with the word "keyword" within subject line
##D dat3 <-extractKeyword(username="username@gmail.com",
##D                       password="password",
##D                       kw="keyword",
##D                       nmail=5)       
##D # To extract maximum 5 emails with the word "keyword" within body message
##D dat4 <-extractKeywordB(username="username@gmail.com",
##D                        password="password",
##D                        kw="keyword",
##D                        nmail=5)
##D  
## End(Not run)



