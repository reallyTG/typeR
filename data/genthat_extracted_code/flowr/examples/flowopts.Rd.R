library(flowr)


### Name: flowopts
### Title: Default options/params used in flowr and ngsflows
### Aliases: flowopts get_opts load_opts opts_flow opts_flow$get
###   opts_flow$load opts_flow$set set_opts
### Keywords: datasets

### ** Examples

## Set options: opts_flow$set()
opts = opts_flow$set(flow_run_path = "~/mypath")
## OR if you would like to supply a long list of options:
opts = opts_flow$set(.dots = list(flow_run_path = "~/mypath"))

## load options from a configuration file: opts_flow$load()
conffile = fetch_conf("flowr.conf")
opts_flow$load(conffile)

## Fetch options: get_opts()
opts_flow$get("flow_run_path")
opts_flow$get()




