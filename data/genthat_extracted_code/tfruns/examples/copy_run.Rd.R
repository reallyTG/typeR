library(tfruns)


### Name: copy_run
### Title: Copy run directories
### Aliases: copy_run copy_run_files

### ** Examples

## Not run: 
##D 
##D # export a run directory to the current working directory
##D copy_run("runs/2017-09-24T10-54-00Z")
##D 
##D # export to the current working directory then rename
##D copy_run("runs/2017-09-24T10-54-00Z", rename = "best-run")
##D 
##D # export artifact files only to the current working directory then rename
##D copy_run_files("runs/2017-09-24T10-54-00Z", rename = "best-model")
##D 
##D # export 3 best eval_acc to a "best-runs" directory
##D copy_run(ls_runs(order = eval_acc)[1:3,], to = "best-runs")
##D 
## End(Not run)



