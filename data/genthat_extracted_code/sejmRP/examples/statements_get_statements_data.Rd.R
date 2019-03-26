library(sejmRP)


### Name: statements_get_statements_data
### Title: Getting data about statements
### Aliases: statements_get_statements_data

### ** Examples

## Not run: 
##D page <- safe_html(paste0('http://www.sejm.gov.pl/Sejm7.nsf/',
##D                'wypowiedz.xsp?posiedzenie=15&dzien=1&wyp=0'))
##D page <- html_nodes(page, '.stenogram')
##D statements_links <- html_nodes(page, 'h2 a')
##D statements_get_statements_data(statements_links,
##D   home_page = 'http://www.sejm.gov.pl/Sejm7.nsf/')
## End(Not run)




