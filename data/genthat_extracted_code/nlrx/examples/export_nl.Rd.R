library(nlrx)


### Name: export_nl
### Title: Export NetLogo Experiment
### Aliases: export_nl

### ** Examples

## No test: 

# Load nl object from testdata:
nl <- nl_lhs
path <- getwd() # adjust path to your needs, path should point to a directory with model data
outfile <- tempfile(fileext = ".zip") # adjust file path to your needs
export_nl(nl, path = path, tarfile = outfile)
## End(No test)



