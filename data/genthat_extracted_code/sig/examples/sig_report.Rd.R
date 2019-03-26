library(sig)


### Name: sig_report
### Title: Summarise function complexity of a file or environment
### Aliases: print.sigreport sig_report sig_report.character
###   sig_report.default sig_report.environment

### ** Examples

#Summarise function complexity in an environment
sig_report(pkg2env(stats))
#Summarise function complexity in a file
## Not run: 
##D tmp <- tempfile(fileext = ".R")
##D writeLines(c(toString(sig(scan)), deparse(body(scan))), tmp)
##D sig_report(tmp)
## End(Not run)
# Adjust the cutoff for reporting
sig_report(
  baseenv(),
  too_many_args  = 20,
  too_many_lines = 100
)



