library(workflowr)


### Name: wflow_git_commit
### Title: Commit files
### Aliases: wflow_git_commit

### ** Examples

## Not run: 
##D 
##D # Commit a single file
##D wflow_git_commit("analysis/file.Rmd", "Add new analysis")
##D # Commit multiple files
##D wflow_git_commit(c("code/process-data.sh", "output/small-data.txt"),
##D              "Process data set")
##D # Add and commit all tracked files, similar to `git commit -a`
##D wflow_git_commit(message = "Lots of changes", all = TRUE)
## End(Not run)




