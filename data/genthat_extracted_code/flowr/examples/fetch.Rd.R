library(flowr)


### Name: fetch
### Title: Two generic functions to search for pipelines and configuration
###   files.
### Aliases: fetch fetch_conf fetch_pipes

### ** Examples


## let us find a default conf file
conf = fetch_conf("flowr.conf");conf
## load this
opts_flow$load(conf)

## this returns a list, which prints pretty
pip = fetch_pipes("sleep_pipe")
pip$name
pip$pipe
pip$def




