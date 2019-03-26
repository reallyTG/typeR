library(aRxiv)


### Name: arxiv_count
### Title: Count number of results for a given search
### Aliases: arxiv_count

### ** Examples

## Don't show: 
old_delay <- getOption("aRxiv_delay")
          options(aRxiv_delay=1)
## End(Don't show)
## No test: 
# count papers in category stat.AP (applied statistics)
arxiv_count(query = "cat:stat.AP")

# count papers by Peter Hall in any stat category
arxiv_count(query = 'au:"Peter Hall" AND cat:stat*')

# count papers for a range of dates
#    here, everything in 2013
arxiv_count("submittedDate:[2013 TO 2014]")
## End(No test)
## Don't show: 
options(aRxiv_delay=old_delay)
## End(Don't show)




