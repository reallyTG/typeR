library(params)


### Name: load_opts
### Title: Setting/loading and extracting various options into the
###   environment
### Aliases: get_opts load_opts new_opts params print.opts set_opts

### ** Examples

## Set options
opts = set_opts(flow_run_path = "~/mypath")
#OR
opts = set_opts(.dots = list(flow_run_path = "~/mypath"))

## printing options, this is internally called by get_opts()
print(opts)

## Fetch options
get_opts()
get_opts("flow_run_path")

## Load options from a file
fl = system.file("conf/params.conf", package = "params")
load_opts(fl)


## Create a options manager:
opts_mypkg = new_opts()
## this provides three functions
opts_mypkg$set(version = '0.1', name = 'mypkg')
opts_mypkg$load(fl)
opts_mypkg$get()

## Additionally, one has the options of using braces ({{}})
## do define nested options:

set_opts(first = "John", last = "Doe", full = "{{first}} {{last}}")




