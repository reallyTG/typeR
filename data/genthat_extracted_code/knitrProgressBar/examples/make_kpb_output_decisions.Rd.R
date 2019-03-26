library(knitrProgressBar)


### Name: make_kpb_output_decisions
### Title: Progress Output Location
### Aliases: make_kpb_output_decisions

### ** Examples

## Not run: 
##D # suppress output when not interactive
##D options(kpb.suppress_noninteractive = TRUE)
##D 
##D # use a log-file, will default to kpb_output.txt
##D options(kpb.use_logfile = TRUE)
##D 
##D # use a specific log-file
##D options(kpb.use_logfile = TRUE)
##D options(kpb.log_file = "progress.txt")
##D 
##D # use a log-file based on chunk names
##D options(kpb.use_logfile = TRUE)
##D options(kpb.log_pattern = "pb_out_")
##D # for a document with a chunk labeled: "longcalc", this will generate "pb_out_longcalc.log"
## End(Not run)




