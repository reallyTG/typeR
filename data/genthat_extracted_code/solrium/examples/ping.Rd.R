library(solrium)


### Name: ping
### Title: Ping a Solr instance
### Aliases: ping

### ** Examples

## Not run: 
##D # start Solr, in your CLI, run: `bin/solr start -e cloud -noprompt`
##D # after that, if you haven't run `bin/post -c gettingstarted docs/` yet,
##D # do so
##D 
##D # connect: by default we connect to localhost, port 8983
##D (cli <- SolrClient$new())
##D 
##D # ping the gettingstarted index
##D cli$ping("gettingstarted")
##D ping(cli, "gettingstarted")
##D ping(cli, "gettingstarted", wt = "xml")
##D ping(cli, "gettingstarted", verbose = FALSE)
##D ping(cli, "gettingstarted", raw = TRUE)
##D 
##D ping(cli, "gettingstarted", wt="xml", verbose = TRUE)
## End(Not run)



