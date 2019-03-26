library(workflowr)


### Name: wflow_start
### Title: Start a new workflowr project
### Aliases: wflow_start

### ** Examples

## Not run: 
##D 
##D wflow_start("path/to/new-project")
##D 
##D # Provide a custom name for the project.
##D wflow_start("path/to/new-project", name = "My Project")
##D 
##D # Preview what wflow_start would do
##D wflow_start("path/to/new-project", dry_run = TRUE)
##D 
##D # Add workflowr files to an existing project.
##D wflow_start("path/to/current-project", existing = TRUE)
##D 
##D # Add workflowr files to an existing project, but do not automatically
##D # commit them.
##D wflow_start("path/to/current-project", git = FALSE, existing = TRUE)
## End(Not run)




