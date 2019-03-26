library(analogsea)


### Name: as.domain_record
### Title: List, create, update, and delete domain records.
### Aliases: as.domain_record as.domain_record.list
###   as.domain_record.domain_record as.url.domain_record domain_records
###   domain_record domain_record_create domain_record_update
###   domain_record_delete

### ** Examples

## Not run: 
##D # list domains, then get domain records
##D (d <- domains()[[1]])
##D (rec <- domain_records(d))
##D 
##D # create a domain
##D dom <- domain_create('tablesandchairsbunnies.info', '107.170.220.59')
##D ## list domain records
##D domain_records(dom)
##D 
##D # create a domain record
##D dr <- domain_record_create(dom, "CNAME", name = "helloworld", data = "@")
##D domain_record(dom, dr$id)
##D 
##D # update a domain record
##D dru <- domain_record_update(domain_record = dr, name = "blog")
##D 
##D # delete a domain record
##D domain_record_delete(dr)
## End(Not run)



